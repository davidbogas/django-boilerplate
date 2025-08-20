import os
from decouple import config
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from channels.security.websocket import AllowedHostsOriginValidator

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

ON_PRODUCTION = config('ON_PRODUCTION', default=False, cast=bool)

# Initialize Django first, then import routing
django_asgi_app = get_asgi_application()
from . import routing

# For development (handles HTTP + WebSocket)
if not ON_PRODUCTION:
    application = ProtocolTypeRouter({
        "http": django_asgi_app,
        "websocket": AllowedHostsOriginValidator(
            AuthMiddlewareStack(URLRouter(routing.websocket_urlpatterns))
        ),
    })
else:
    application = AllowedHostsOriginValidator(
        AuthMiddlewareStack(URLRouter(routing.websocket_urlpatterns))
    )
