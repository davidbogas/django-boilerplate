from django.urls import path
from channels.routing import URLRouter
from ws import routing as ws_routing

websocket_urlpatterns = [
    path('ws/', URLRouter(ws_routing.websocket_urlpatterns)),
] 