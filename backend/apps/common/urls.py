from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns
from apps.common import views

urlpatterns = [
    url(r'^$', views.IntroPage.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
