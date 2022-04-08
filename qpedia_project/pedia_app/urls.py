from calendar import c
from django.contrib import admin
from django.urls import path
from pedia_app import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('teams/', views.teams, name='teams'),
    path('matches/', views.matches, name='matches'),
    path('tournies/', views.tournies, name='tournies'),
    path('edit_matches/', views.edit_matches, name='edit_matches'),
    path('edit_teams/', views.edit_teams, name='edit_teams'),
    path('edit_tournies/', views.edit_tournies, name='edit_tournies'),
    path('edit_match/<match_id>', views.edit_match, name='edit_match'),
    path('edit_team/<team_id>', views.edit_team, name='edit_team'),
    path('edit_tourney/<tourney_id>', views.edit_tourney, name='edit_tourney'),
    path('delete_match/<match_id>', views.delete_match, name='delete_match'),
    path('delete_team/<team_id>', views.delete_team, name='delete_team'),
    path('delete_tourney/<tourney_id>', views.delete_tourney, name='delete_tourney'),
]