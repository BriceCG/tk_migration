from tkinter import *
from tkinter import messagebox
from tkinter import ttk as tkinter_pro
from threading import *
from PIL import Image,ImageFile
class fenetre():
    def __init__(self):
        self.fen= Tk()
    
    def create(self, title, x, y, background="white", resize=FALSE):
        self.fen.title(title)
        if resize:
            self.fen.resizable(width=TRUE, height=TRUE)
        else:
            self.fen.resizable(width=FALSE, height=FALSE)
        self.fen.config(background=background)
        pos_x = (self.fen.winfo_screenwidth() // 2) - (x // 2)
        pos_y = ((self.fen.winfo_screenheight() // 2) - (y // 2)) - 40
        self.fen.geometry(f"{x}x{y}+{pos_x}+{pos_y}")