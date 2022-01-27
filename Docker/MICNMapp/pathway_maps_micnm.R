#######APP###########
library(shiny)
library(pathview)
library(sjmisc)

ui <- fluidPage(
  
  # App title ----
  titlePanel("Proteomics and Metabolomics Pathways"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      helpText("KEGG maps"),
      
      textInput("pathway", h5("Pathway Type"), 
                value = "spu00010"),   
      
      textInput("data", h5("Data Type"), 
                value = "MIC/NM")
      ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Pathway Map ----
      tabsetPanel(
        #Different tabs for our app:
        ####1.) Proteomic Mic/NM vs Metabolomics Mic/NM (2019)
        ####2.) Metabolomics: 2DG, Cer, and NaN3 (normalized to DMSO with Mic/NM ratios)
        tabPanel("Prot Mic vs NM", imageOutput("pathway.map")),
        tabPanel("Inhibitor Metabolomics (Order: 2DG, Cer, NaN3)", imageOutput("inh.path.map.multi"))
      )
    )
  )
)




# Define server logic required to draw a pathway ----
server <- function(input, output) {
  proteomics <- read.csv(file = "mic.m.nm.proteomics.csv", row.names = 1)
  metabolomics <- read.csv(file = "mic.m.nm.metabolomics.csv", row.names = 1)
  metabolomics_inh <- read.csv(file = "mic.m.nm.inh.metabolomics.csv", row.names = 1)
  
  output$pathway.map <- renderImage({
    # Generate the PNG
    pathview(gene.data  = proteomics,
             cpd.data =  metabolomics,
             pathway.id = input$pathway,
             species    = 'spu',
             discrete = list(gene = TRUE, cpd = TRUE),
             match.data = FALSE)
    
    #outfile = paste0("C:/Users/shaks/OneDrive/Documents/R/Proteomics Summer/App/MIC NM/",input$pathway,".pathview.png")
    outfile = paste0(input$pathway,".pathview.png")
    list(src = outfile)
    #if list is NULL then do... alternative which is take in pathview not multipathview.
    
    
  }, deleteFile = FALSE
  )
  
  output$inh.path.map.multi <- renderImage({
    # Generate the PNG
    pathview(cpd.data =  metabolomics_inh,
             pathway.id = input$pathway,
             species    = 'spu',
             discrete = list(cpd = TRUE),
             match.data = FALSE)
    
    #outfile = paste0("C:/Users/shaks/OneDrive/Documents/R/Proteomics Summer/App/MIC NM/",input$pathway,".pathview.multi.png")
    outfile = paste0(input$pathway,".pathview.multi.png")
    list(src = outfile)
    #if list is NULL then do... alternative which is take in pathview not multipathview.

  }, deleteFile = FALSE
  )
  }
    
    
    
# Create Shiny app ----
shinyApp(ui = ui, server = server)


####TRASH######
#output$pathway.map.multi <- renderImage({
  # Generate the PNG
 # pathview(gene.data  = proteomics,
  #         cpd.data =  metabolomics,
   #        pathway.id = input$pathway,
    #       species    = 'spu',
     #      discrete = list(gene = TRUE, cpd = TRUE),
      #     match.data = FALSE)
  
  #outfile = paste0("C:/Users/shaks/OneDrive/Documents/R/Proteomics Summer/App/MIC NM/",input$pathway,".pathview.multi.png")
  #outfile = paste0(input$pathway,".pathview.multi.png")
  #list(src = outfile)
  #if list is NULL then do... alternative which is take in pathview not multipathview.
  
  
#}, deleteFile = FALSE
#)