from django.test import TestCase
from config.celery import debug_task


class CeleryTaskTests(TestCase):
    '''Tests for Celery tasks'''
    
    def test_debug_task(self):
        '''Test that debug_task works correctly'''
        # Execute task directly (without delay)
        result = debug_task()
        
        # Verify it executed without errors
        self.assertIsNone(result)
        
        print('Test debug_task executed successfully')
        print('The debug_task prints request information in the logs')
    
    def test_debug_task_with_delay(self):
        '''Test that the task can be executed with delay (async mode)'''
        # This test requires Celery to be configured in eager mode
        # (CELERY_TASK_ALWAYS_EAGER = True in test settings)
        try:
            result = debug_task.delay()
            print('Test debug_task with .delay() executed successfully')
            print(f'Task result: {result}')
            if hasattr(result, 'id'):
                print(f'Task ID: {result.id}')
            # If we get here, the task executed successfully
            self.assertTrue(True)
        except Exception as e:
            print(f'Error in test_debug_task_with_delay: {e}')
            self.fail(f'The debug_task failed with delay: {e}')


