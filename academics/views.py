from django.shortcuts import render

def learn(request):
    return render(request, 'academics/learn.html')

def explore(request):
    return render(request, 'academics/explore.html')

def innovate(request):
    return render(request, 'academics/innovate.html')
