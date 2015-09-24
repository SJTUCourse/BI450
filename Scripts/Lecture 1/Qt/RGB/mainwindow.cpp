#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    drawPreview();

    connect(ui->redSlider,SIGNAL(valueChanged(int)),this,SLOT(drawPreview()));
    connect(ui->greenSlider,SIGNAL(valueChanged(int)),this,SLOT(drawPreview()));
    connect(ui->blueSlider,SIGNAL(valueChanged(int)),this,SLOT(drawPreview()));
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::drawPreview(){
   QPixmap pixmap(100,100);
   pixmap.fill(QColor(ui->redSlider->value(),ui->greenSlider->value(),ui->blueSlider->value()));

   ui->colorviewer->setPixmap(pixmap);

}
