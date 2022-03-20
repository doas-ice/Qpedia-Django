import re
import os
from datetime import datetime
from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.shortcuts import render, redirect
from pedia_app.models import Teams, Tournies, Matches
# Create your views here.


def index(request):
	return render(request, 'pedia_app/index.html')
def teams(request):
	teams = Teams.objects.all().order_by('rank')
	context = {'teams':teams}
	return render(request, 'pedia_app/teams.html', context)
def matches(request):
	matches = Matches.objects.all()
	context = {'matches':matches}
	return render(request, 'pedia_app/matches.html', context)
def tournies(request):
	tournies = Tournies.objects.all()
	context = {'tournies':tournies}
	return render(request, 'pedia_app/tournies.html', context)
def edit_teams(request):
	teams = Teams.objects.all().order_by('rank')
	context = {'teams':teams}
	if request.method == 'POST':
		teams = Teams()
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
def edit_matches(request):
	# if request.method == 'POST':
	# 	teams = Teams()
	# 	name = request.POST.get('name')
	# 	rank = request.POST.get('rank')
	# 	region = request.POST.get('region')
	# 	teams.name=name
	# 	teams.rank=rank
	# 	teams.region=region

	# 	if len(request.FILES) != 0:
	# 		teams.logo = request.FILES['logo']

	# 	teams.save()
	# 	messages.success(request, "Team "+name+" Added!")
	# 	return redirect('/')
	return render(request, 'pedia_app/edit_matches.html')
def edit_tournies(request):
	tournies = Tournies.objects.all().order_by('date_start')
	context = {'tournies':tournies}
	if request.method == 'POST':
		tournies = Tournies()
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
def delete_team(request, team_id):
	team = Teams.objects.get(pk=team_id)
	# if team.logo:
		# os.remove(team.logo.path)
	team.delete()
	messages.success(request, "Successfuly deleted the team entry")
	return redirect('edit_teams')
def contact(request):
	return render(request, 'pedia_app/contact.html')