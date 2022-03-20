from django.db import models
import datetime, os

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
	is_finished = models.BooleanField(null=True, blank=True)
	winner = models.IntegerField(null=True, blank=True)

class Matches(models.Model):
	tournament = models.IntegerField()
	team1 = models.IntegerField()
	team2 = models.IntegerField()
	score1 = models.IntegerField()
	score2 = models.IntegerField()
	time = models.DateTimeField()
	
