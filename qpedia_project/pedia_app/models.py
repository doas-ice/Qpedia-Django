import os
from django.db import models

# Create your models here.

class Teams(models.Model):
	rank = models.IntegerField()
	name = models.CharField(max_length=50)
	region = models.CharField(max_length=50)
	logo = models.ImageField(upload_to='teams/uploads/', null=True, blank=True)

class Tournies(models.Model):
	tier = models.CharField(max_length=1)
	name = models.CharField(max_length=100)
	region = models.CharField(max_length=50)
	logo = models.ImageField(upload_to='tournies/uploads/', null=True, blank=True)
	date_start = models.DateTimeField()
	date_end = models.DateTimeField()
	is_finished = models.BooleanField(default=False)
	winner = models.ForeignKey(Teams, on_delete=models.SET_NULL, null=True, blank=True)

class Matches(models.Model):
	T1 = 'T1'
	T2 = 'T2'
	DW = 'DW'
	ON = 'ON'
	WINNER_CHOICES = [
		(T1, 'Team1'),
		(T2, 'Team2'),
		(DW, 'Draw'),
		(ON, 'Ongoing'),
	]
	tourney = models.ForeignKey(Tournies, on_delete=models.CASCADE)
	team1 = models.ForeignKey(Teams, on_delete=models.CASCADE, related_name='t1')
	team2 = models.ForeignKey(Teams, on_delete=models.CASCADE, related_name='t2')
	score1 = models.IntegerField()
	score2 = models.IntegerField()
	time = models.DateTimeField()
	is_finished = models.BooleanField(default=False)
	winner = models.CharField(max_length=2, choices=WINNER_CHOICES, default=ON)

class Players(models.Model):
	name = models.CharField(max_length=100)
	country = models.CharField(max_length=100)
	age = models.IntegerField()
	ign = models.CharField(max_length=100)
	team = models.ForeignKey(Teams, on_delete=models.SET_NULL, null=True, blank=True)
	photo = models.ImageField(upload_to='players/uploads/', null=True, blank=True)