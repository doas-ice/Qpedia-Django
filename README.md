# Qpedia-Django
An e-sports wiki and scheduling site created using python django and bulma css framework.

# Preview
![Preview GIF](https://github.com/doas-ice/Qpedia-Django/blob/0e1a4e6c3785dd95b4b9b4d10ecfb1e56cbdbbb5/qpedia.gif)

# How to run
- Use a virtual environment like virtualenv or conda
```
pip install django mysqlclient Pillow
```
- Import the pedia_db.sql database
- Configure the database in settings.py
```
python manage.py migrate
python manage.py runserver
```
