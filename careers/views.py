from django.shortcuts import render

def careers_view(request):
    return render(request, 'careers/careers.html')
