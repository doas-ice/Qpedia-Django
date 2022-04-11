from pedia_app.models import Teams, Players

def ranks(request):
	rankplayers = Players.objects.all().order_by('rank')
	rankteams = Teams.objects.all().order_by('rank')
	return {'rankplayers':rankplayers, 'rankteams':rankteams}