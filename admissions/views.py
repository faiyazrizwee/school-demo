from django.shortcuts import render

def admission_view(request):
    return render(request, 'admissions/admission.html')
