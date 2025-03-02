from django import template
import datetime


register = template.Library()

@register.simple_tag
def custom_tag(value):
    return value

@register.filter
def custom_filter(value):
    return value