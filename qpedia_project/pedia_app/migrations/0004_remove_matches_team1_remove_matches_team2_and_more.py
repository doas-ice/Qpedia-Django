# Generated by Django 4.0.3 on 2022-03-25 13:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pedia_app', '0003_alter_tournies_tier'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='matches',
            name='team1',
        ),
        migrations.RemoveField(
            model_name='matches',
            name='team2',
        ),
        migrations.RemoveField(
            model_name='matches',
            name='tournament',
        ),
        migrations.AddField(
            model_name='matches',
            name='t1_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='t1', to='pedia_app.teams'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='matches',
            name='t2_id',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.CASCADE, related_name='t2', to='pedia_app.teams'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='matches',
            name='tourney_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='pedia_app.tournies'),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='MatchResult',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('match_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pedia_app.matches')),
                ('winner_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='pedia_app.teams')),
            ],
        ),
    ]
