import * as bootstrap from "bootstrap"

// Initialize bootstrap popovers
const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

// Alternate implementation
//let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
//let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
//  return new bootstrap.Popover(popoverTriggerEl)  
//})    
