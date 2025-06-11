from markupsafe import Markup

class State:
    def __init__(self, db):
        self.db = db
        self.name = 'Bob'
    
    def render_balance(self):
        return Markup('<em>$100</em>')
    
