import json
from channels.generic.websocket import AsyncWebsocketConsumer

class TestConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        await self.accept()
        # Send HTML with hx-swap-oob for HTMX WebSocket
        await self.send(text_data='<div id="status" hx-swap="swap"><div class="alert alert-success mb-2">WebSocket connection established!</div></div>')

    async def disconnect(self, close_code):
        pass

    async def receive(self, text_data):
        try:
            # Try to parse as JSON first (from HTMX form data)
            text_data_json = json.loads(text_data)
            message = text_data_json.get('message', text_data)
        except json.JSONDecodeError:
            # If not JSON, treat as plain text
            message = text_data

        # Send HTML response with hx-swap-oob for HTMX WebSocket
        await self.send(text_data=f'<div id="messages" hx-swap-oob="beforeend"><div class="chat chat-sender"><div class="chat-bubble">{message}</div></div></div>')