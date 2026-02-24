from django.urls import path
from . import views

urlpatterns = [
    path('learn/', views.learn, name='learn'),
    path('explore/', views.explore, name='explore'),
    path('innovate/', views.innovate, name='innovate'),
]
