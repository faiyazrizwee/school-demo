from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
    path('', include('academics.urls')),
    path('admission/', include('admissions.urls')),
    path('careers/', include('careers.urls')),
]
