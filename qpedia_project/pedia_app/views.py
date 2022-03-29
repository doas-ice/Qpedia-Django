import re
import os
from datetime import datetime
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.shortcuts import render, redirect
from pedia_app import models
# Create your views here.


def index(request):
	return render(request, 'pedia_app/index.html')

def matches(request):
	matches = models.Matches.objects.all().order_by('time')
	context = {'matches':matches}
	return render(request, 'pedia_app/matches.html', context)

def teams(request):
	teams = models.Teams.objects.all().order_by('rank')
	context = {'teams':teams}
	return render(request, 'pedia_app/teams.html', context)

def tournies(request):
	tournies = models.Tournies.objects.all().order_by('date_end')
	context = {'tournies':tournies}
	return render(request, 'pedia_app/tournies.html', context)

def edit_matches(request):
	tourney = models.Tournies.objects.all().order_by('date_start')
	teams = models.Teams.objects.all().order_by('name')
	matches = models.Matches.objects.all().order_by('time')
	result = models.MatchResult.objects.all()
	context = {'teams':teams, 'matches':matches, 'result':result, 'tourney':tourney}
	if request.method == 'POST':
		matches = models.Matches()
		result = models.MatchResult()
		tourney = request.POST.get('tourney')
		team1 = request.POST.get('team1')
		team2 = request.POST.get('team2')
		score1 = request.POST.get('score1')
		score2 = request.POST.get('score2')
		time = request.POST.get('time')
		matches.tourney_id = models.Tournies.objects.get(pk=tourney)
		t1 = models.Teams.objects.get(pk=team1)
		t2 = models.Teams.objects.get(pk=team2)
		matches.t1_id = t1
		matches.t2_id = t2
		matches.score1 = score1
		matches.score2 = score2
		matches.time = datetime.strptime(time, '%d/%m/%Y, %I:%M %p').strftime('%Y-%m-%d %H:%M')
		matches.save()
		messages.success(request, "Match between "+t1.name+" and "+t2.name+" Added!")
		return redirect('edit_matches')
	return render(request, 'pedia_app/edit_matches.html', context)

def edit_teams(request):
	teams = models.Teams.objects.all().order_by('rank')
	context = {'teams':teams}
	if request.method == 'POST':
		teams = models.Teams()
		name = request.POST.get('name')
		rank = request.POST.get('rank')
		region = request.POST.get('region')
		teams.name=name
		teams.rank=rank
		teams.region=region

		if len(request.FILES) != 0:
			teams.logo = request.FILES['logo']

		teams.save()
		messages.success(request, "Team "+name+" Added!")
		return redirect('edit_teams')
	return render(request, 'pedia_app/edit_teams.html', context)

def edit_tournies(request):
	tournies = models.Tournies.objects.all().order_by('date_start')
	context = {'tournies':tournies}
	if request.method == 'POST':
		tournies = models.Tournies()
		name = request.POST.get('name')
		tier = request.POST.get('tier')
		region = request.POST.get('region')
		date_start = request.POST.get('date_start')
		date_end = request.POST.get('date_end')
		tournies.name=name
		tournies.tier=tier
		tournies.region=region
		tournies.date_start=datetime.strptime(date_start, '%d/%m/%Y, %I:%M %p').strftime('%Y-%m-%d %H:%M')
		tournies.date_end=datetime.strptime(date_end, '%d/%m/%Y, %I:%M %p').strftime('%Y-%m-%d %H:%M')

		if len(request.FILES) != 0:
			tournies.logo = request.FILES['logo']

		tournies.save()
		messages.success(request, "Tournament "+name+" Added!")
		return redirect('edit_tournies')
	return render(request, 'pedia_app/edit_tournies.html', context)

def edit_match(request, match_id):
	match = models.Matches.objects.get(pk=match_id)
	# if request.method == 'POST':
	# 	if len(request.FILES) != 0:
	# 		if len(match.logo) > 0:
	# 			os.remove(team.logo.path)
	# 		team.logo = request.FILES['logo']
	# 	team.name = request.POST.get('name')
	# 	team.rank = request.POST.get('rank')
	# 	team.region = request.POST.get('region')
	# 	team.save()
	# 	messages.success(request, "Team entry updated")
	# 	return redirect('edit_teams')
	context = {'match':match}
	return render(request, 'pedia_app/edit_match.html', context)

def edit_team(request, team_id):
	team = models.Teams.objects.get(pk=team_id)
	if request.method == 'POST':
		if len(request.FILES) != 0:
			if len(team.logo) > 0:
				os.remove(team.logo.path)
			team.logo = request.FILES['logo']
		team.name = request.POST.get('name')
		team.rank = request.POST.get('rank')
		team.region = request.POST.get('region')
		team.save()
		messages.success(request, "Team entry updated")
		return redirect('edit_teams')
	context = {'team':team}
	return render(request, 'pedia_app/edit_team.html', context)

# def edit_tourney(request, tourney_id):
	# team = Teams.objects.get(pk=team_id)
	# if request.method == 'POST':
	# 	if len(request.FILES) != 0:
	# 		if len(team.logo) > 0:
	# 			os.remove(team.logo.path)
	# 		team.logo = request.FILES['logo']
	# 	team.name = request.POST.get('name')
	# 	team.rank = request.POST.get('rank')
	# 	team.region = request.POST.get('region')
	# 	team.save()
	# 	messages.success(request, "Team entry updated")
	# 	return redirect('edit_teams')
	# context = {'tourney':tourney}
	# return render(request, 'pedia_app/edit_tourney.html', context)

def delete_match(request, match_id):
	# team = Teams.objects.get(pk=team_id)
	# if team.logo:
	# 	os.remove(team.logo.path)
	# team.delete()
	# messages.success(request, "Successfuly deleted the team entry")
	return redirect('edit_matches')

def delete_team(request, team_id):
	team = models.Teams.objects.get(pk=team_id)
	if team.logo:
		os.remove(team.logo.path)
	team.delete()
	messages.success(request, "Successfuly deleted the team entry")
	return redirect('edit_teams')

def delete_tourney(request, tourney_id):
	# team = Teams.objects.get(pk=team_id)
	# if team.logo:
	# 	os.remove(team.logo.path)
	# team.delete()
	# messages.success(request, "Successfuly deleted the team entry")
	return redirect('edit_tournies')