//
//  ContentView.swift
//  MemberForm
//
//  Created by in112-05-2021-cm on 14/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phone = ""
    @State var selectedRegion = ""
    @State var showingAlert = false
    @State var activeAlert: typeOfError = .firstNameMissing
    @State var successMsg = ""
    
    enum typeOfError {
        case firstNameMissing
        case lastNameMissing
        case emailMissing
        case phoneMissing
        case regionMissing
        case noError
    }
    
    var countries = ["", "Macau", "Hong Kong"]
    
    func stringConcat(_ telephone: String) {
        
        // Check personal details
        if firstName == "" {
            self.activeAlert = .firstNameMissing
            showingAlert = true
        } else if lastName == "" {
            self.activeAlert = .lastNameMissing
            showingAlert = true
        } else if email == "" {
            self.activeAlert = .emailMissing
            showingAlert = true
        } else if phone == "" {
            self.activeAlert = .phoneMissing
            showingAlert = true
        } else if selectedRegion == "" {
            self.activeAlert = .regionMissing
            showingAlert = true
        } else {
            successMsg = "Hello, " + firstName + lastName + "! \n" + "You're from " + selectedRegion + ". \n\n" + "Your phone number is " + phone + "\n" + "and email is " + email + "."
            self.activeAlert = .noError
            showingAlert = true
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Personal Details")) {
                
                    TextField("First Name", text: $firstName)
                
                    TextField("Last Name", text: $lastName)
                
                }
                
                Section(header: Text("Contact")) {
                    
                    TextField("Email", text: $email)
                    
                    TextField("Phone", text: $phone)
                    
                }
                
                Section {
                    
                    Picker("Region", selection: $selectedRegion) {
                        ForEach(countries, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Button("Send", action:{
                    stringConcat(phone)
                    //showingAlert = true
                })
                
                
            }.navigationTitle(Text("Member Form"))
        }.alert(isPresented: $showingAlert) {
            
            switch activeAlert {
            
                case .firstNameMissing:
                    return Alert(title: Text("Oops"), message: Text("Please enter your first name!"))
            
                case .lastNameMissing:
                    return Alert(title: Text("Oops"), message: Text("Please enter your last name!"))
                    
                case .emailMissing:
                    return Alert(title: Text("Oops"), message: Text("Please enter your email address!"))
                    
                case .phoneMissing:
                    return Alert(title: Text("Oops"), message: Text("Please enter your phone number!"))
                    
                case .regionMissing:
                    return Alert(title: Text("Oops"), message: Text("Please select your region!"))
                    
                case .noError:
                    return Alert(title: Text("Success"), message: Text(successMsg))
                    
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
