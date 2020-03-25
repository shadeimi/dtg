from robot.libraries.BuiltIn import BuiltIn

class DynamicTestGenerator(object):
    ROBOT_LISTENER_API_VERSION = 3
    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        self.current_suite = None

    def _start_suite(self, suite, result):
        # save current suite so that we can modify it later
        self.current_suite = suite

    def add_test_case(self, name, kwname, *args):
        tc = self.current_suite.tests.create(name=name)
        tc.keywords.create(name=kwname, args=args)
        

globals()[__name__] = DynamicTestGenerator