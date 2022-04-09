from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

# Create your forms here.

class NewUserForm(UserCreationForm):
	name = forms.CharField(max_length=100,required=True)
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ("name", "username", "email", "password1", "password2")

	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False)
		user.name = self.cleaned_data['name']
		user.email = self.cleaned_data['email']
		if commit:
			user.save()
		return user