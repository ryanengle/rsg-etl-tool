#
# This file is part of the Air Force Institute of Technology (AFIT) 
# Resilient Sensor Grid (RSG) Extract, Transform, Load (ETL) Tool.
#
# Written by:
#               Ryan D. L. Engle
#               ryan.engle@afit.edu, rdengle@gmail.com
#               Air Force Institute of Technology
#               Department of Systems Engineering & Management (ENV)
#               2950 Hobson Way
#               Wright Patterson AFB, Ohio  45433-7765  USA
#
# This source code is property of the United States Government.
#
# NO PART OF THIS PROGRAM MAY BE COPIED, REPRODUCED, OR DUPLICATED WITHOUT
# THE EXPRESSED WRITTEN PERMISSION FROM AFIT/ENV.
#
# # This software is provided "AS IS" and the author disclaims all warranties with 
# regard to this software. In no event shall the author be liable for any indirect 
# or consequential damages arising out of, or in connection with, the use of this 
# software. USE AT YOUR OWN RISK.
#
__version__ = '2020 0210 2211 Eastern'
###############################################################################
from PyQt5 import QtGui, QtCore, QtWidgets
from PyQt5.QtCore import pyqtSignal
import os, sys

import rsg_etl_tool_ui

import findData

class RsgEtlApp(QtWidgets.QMainWindow, rsg_etl_tool_ui.Ui_MainWindow):
    def __init__(self, pathToData=None):
        # Enable access to variables and methods in rsg_etl_tool_ui.py
        super(self.__class__, self).__init__()

        # Defined in rsg_etl_tool_ui.py. Sets up layout and widgets
        self.setupUi(self)

        # Signals and slots (http://pyqt.sourceforge.net/Docs/PyQt5/signals_slots.html)
        # Signals are connected to slots using connect(slotName)
        # File menu - Slots
        # Example
        # self.open_folder.triggered.connect(self.slotOpenFolder)
        
        # Frame Top Frame - Buttons (slots)
        self.butOpenFolder.clicked.connect(self.slotButOpenFolderClicked)

        # Set initial GUI state
        # Disable buttons
        self.butNewTable.setEnabled(False)
        self.butPopulate.setEnabled(False)
        # Reset progress bar
        self.pbProgressBar.setMaximum(1)
        self.pbProgressBar.setValue(0)

        # Other variables
        self.dataFolder = pathToData # Not fully implemented
        self.fqpnFileList = []
###############################################################################

    def checkState(self):
        '''
            Checks various GUI states and updates functionality accordingly
            TODO
        '''
        self.checkStatePopulate()

    def checkStatePopulate(self):
        '''
            Checks whether Populate button should be enabled
        '''
        msg = 'Check 1. A dataFolder is selected, \n2. one or more files are selected, \n3. and a table is selected'
        print msg

    def getFolder(self, previousFolder=None):
        '''
            Prompts user with dialog to select folder
        '''
        widgetTitle = 'Data Folder'
        if previousFolder is None:
            previousFolder = '.'
    
        fqpn = None
        # Option 1
        fqpn, cwd = QtWidgets.QFileDialog.getOpenFileName(self, widgetTitle, previousFolder)
        # Option 2
        #folder = QtWidgets.QFileDialog.getExistingDirectory(self, widgetTitle, previousFolder)
        # Get the folder name 
        # WARNING Remove if using option 2 above
        folder = os.path.dirname(fqpn)

        # determine if folder is valid
        is_a_directory = os.path.isdir(folder)
        directory_exists = os.path.exists(folder)
        if (is_a_directory is False) or (directory_exists is False):            
            msg = 'getFolder(): WARNING: Invalid directory (' + str(folder) +') selected.'
            print msg
            folder = None
        
        return folder    

    def slotButOpenFolderClicked(self):
        '''
            Slot to handle Open Folder button click
        '''
        folder = self.getFolder(self.dataFolder)
        if folder is None:
            # Verify this is the expected behavior.. Consider cancel action
            return

        # Update GUI
        self.checkState() # TODO
        self.dataFolder = folder
        self.lblSelectedDataFolder.setText(self.dataFolder)
        # Fill list with files & update gui list
        # Needs more error checking
        self.fqpnFileList = findData.findData(self.dataFolder)
        self.updateLstFilesInFolder()


    def updateLstFilesInFolder(self):
        '''
            Updates lstFilesInFolder using fqpn data from self.fileList
        '''
        self.lstFilesInFolder.clear()
        for f in self.fqpnFileList:
            self.lstFilesInFolder.addItem(os.path.basename(f))

        




def start(pathToData=None):
    '''
        Starts the application execution loop
        TODO fully implement pathToData
    '''
    app = QtWidgets.QApplication(sys.argv)
    form = RsgEtlApp(pathToData)
    form.show()
    app.exec_()

if __name__ == "__main__":
    start()