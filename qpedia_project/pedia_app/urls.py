from calendar import c
from django.contrib import admin
from django.urls import path
from pedia_app.views import index, teams, matches, tournies, edit_matches, edit_teams, edit_tournies

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('teams/', teams, name='teams'),
    path('matches/', matches, name='matches'),
    path('tournies/', tournies, name='tournies'),
    path('edit_matches/', edit_matches, name='edit_matches'),
    path('edit_teams/', edit_teams, name='edit_teams'),
    path('edit_tournies/', edit_tournies, name='edit_tournies'),
]