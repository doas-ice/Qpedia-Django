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

def players(request):
	players = models.Players.objects.all().order_by('name')
	context = {'players':players}
	return render(request, 'pedia_app/players.html', context)

def edit_matches(request):
	tourney = models.Tournies.objects.all().order_by('date_start')
	teams = models.Teams.objects.all().order_by('name')
	matches = models.Matches.objects.all().order_by('time')
	context = {'teams':teams, 'matches':matches, 'tourney':tourney}
	if request.method == 'POST':
		matches = models.Matches()
		matches.tourney = models.Tournies.objects.get(pk=request.POST.get('tourney'))
		team1 = request.POST.get('team1')
		team2 = request.POST.get('team2')
		t1 = models.Teams.objects.get(pk=team1)
		t2 = models.Teams.objects.get(pk=team2)
		matches.team1 = t1
		matches.team2 = t2
		score1 = request.POST.get('score1')
		score2 = request.POST.get('score2')
		matches.score1 = score1
		matches.score2 = score2
		time = request.POST.get('time')
		matches.time = datetime.strptime(time + ' +0600', '%d/%m/%Y, %I:%M %p %z').strftime('%Y-%m-%d %H:%M%z')
		status = request.POST.get('status')
		if status == 'on':
			status = True
		else:
			status = False
		matches.is_finished = status
		if status == True:
			if score1 > score2:
				matches.winner = 'T1'
			elif score2 > score1:
				matches.winner = 'T2'
			else:
				matches.winner = 'DW'
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

def edit_players(request):
	players = models.Players.objects.all().order_by('name')
	teams = models.Teams.objects.all().order_by('name')
	context = {'players':players, 'teams':teams}
	if request.method == 'POST':
		players = models.Players()
		name = request.POST.get('name')
		players.name = name
		players.country = request.POST.get('country')
		players.age = request.POST.get('age')
		players.ign = request.POST.get('ign')
		team_id = request.POST.get('team')
		team = models.Teams.objects.get(pk=team_id)
		players.team = team

		if len(request.FILES) != 0:
			players.photo = request.FILES['photo']

		players.save()
		messages.success(request, "Player "+name+" Added!")
		return redirect('edit_players')
	return render(request, 'pedia_app/edit_players.html', context)

def edit_match(request, match_id):
	match = models.Matches.objects.get(pk=match_id)
	tourney = models.Tournies.objects.all().order_by('date_start')
	teams = models.Teams.objects.all().order_by('name')
	# frtime = datetime.strptime(match.time), '%Y-%m-%d %H:%M').strftime('%d/%m/%Y, %I:%M %p')
	frtime = match.time.strftime('%d/%m/%Y, %I:%M %p') #Formatted Time
	context = {'match':match, 'teams':teams, 'tourney':tourney, 'frtime':frtime}
	if request.method == 'POST':
		match.tourney = models.Tournies.objects.get(pk=request.POST.get('tourney'))
		team1 = request.POST.get('team1')
		team2 = request.POST.get('team2')
		match.team1 = models.Teams.objects.get(pk=team1)
		match.team2 = models.Teams.objects.get(pk=team2)
		score1 = request.POST.get('score1')
		score2 = request.POST.get('score2')
		match.score1 = score1
		match.score2 = score2
		time = request.POST.get('time')
		match.time = datetime.strptime(time + ' +0600', '%d/%m/%Y, %I:%M %p %z').strftime('%Y-%m-%d %H:%M%z')
		status = request.POST.get('status')
		if status == 'on':
			status = True
		else:
			status = False
		match.is_finished = status
		if status == True:
			if score1 > score2:
				match.winner = 'T1'
			elif score2 > score1:
				match.winner = 'T2'
			else:
				match.winner = 'DW'
		match.save()
		messages.success(request, "Match entry updated!")
		return redirect('edit_matches')
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

def edit_tourney(request, tourney_id):
	tourney = models.Tournies.objects.get(pk=tourney_id)
	frdate_start = tourney.date_start.strftime('%d/%m/%Y, %I:%M %p') 
	frdate_end = tourney.date_end.strftime('%d/%m/%Y, %I:%M %p') 
	if request.method == 'POST':
		if len(request.FILES) != 0:
			if len(tourney.logo) > 0:
				os.remove(tourney.logo.path)
			tourney.logo = request.FILES['logo']
		date_start = request.POST.get('date_start')
		date_end = request.POST.get('date_end')
		tourney.name = request.POST.get('name')
		tourney.tier = request.POST.get('tier')
		tourney.region = request.POST.get('region')
		tourney.date_start=datetime.strptime(date_start, '%d/%m/%Y, %I:%M %p').strftime('%Y-%m-%d %H:%M')
		tourney.date_end=datetime.strptime(date_end, '%d/%m/%Y, %I:%M %p').strftime('%Y-%m-%d %H:%M')
		tourney.save()
		messages.success(request, "Tournament entry updated!")
		return redirect('edit_tournies')
	context = {'tourney':tourney, 'frdate_start':frdate_start, 'frdate_end':frdate_end}
	return render(request, 'pedia_app/edit_tourney.html', context)

def edit_player(request, player_id):
	player = models.Players.objects.get(pk=player_id)
	teams = models.Teams.objects.all().order_by('name')
	if request.method == 'POST':
		if len(request.FILES) != 0:
			if len(player.photo) > 0:
				os.remove(player.photo.path)
			player.photo = request.FILES['photo']
		player.name = request.POST.get('name')
		player.country = request.POST.get('country')
		player.age = request.POST.get('age')
		player.ign = request.POST.get('ign')
		team = models.Teams.objects.get(pk=team)
		player.team = team

		player.save()
		messages.success(request, "Player entry updated!")
		return redirect('edit_players')
	context = {'player':player, 'teams':teams}
	return render(request, 'pedia_app/edit_player.html', context)

def delete_match(request, match_id):
	match = models.Matches.objects.get(pk=match_id)
	match.delete()
	messages.success(request, "Successfuly deleted the match entry")
	return redirect('edit_matches')

def delete_team(request, team_id):
	team = models.Teams.objects.get(pk=team_id)
	if team.logo:
		os.remove(team.logo.path)
	team.delete()
	messages.success(request, "Successfuly deleted the team entry")
	return redirect('edit_teams')

def delete_tourney(request, tourney_id):
	tourney = models.Tournies.objects.get(pk=tourney_id)
	if tourney.logo:
		os.remove(tourney.logo.path)
	tourney.delete()
	messages.success(request, "Successfuly deleted the tournament entry")
	return redirect('edit_tournies')

def delete_player(request, player_id):
	player = models.Players.objects.get(pk=player_id)
	if player.photo:
		os.remove(player.photo.path)
	player.delete()
	messages.success(request, "Successfuly deleted the Player entry")
	return redirect('edit_players')