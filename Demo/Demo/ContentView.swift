//
//  ContentView.swift
//  Demo
//
//  Created by Anbusekar Murugesan on 25/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    @State var firstName: String = ""
    @State var LastName: String = ""
    @State var textFieldWidth: CGFloat = UIScreen.main.bounds.size.width - 50
    
    var body: some View {
         ZStack {
            //loginView().edgesIgnoringSafeArea(.all)
            Color.cyan.ignoresSafeArea()
                .blur(radius: 20, opaque: false)
            VStack{
                Text("Learning Task 1")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.title3)
                Spacer()
            }
            VStack {
                Text("Welcome")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                Image("logo", bundle: nil, label: Text("logos"))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipped()
                    .padding(.bottom, 30)
                VStack {
                    TextField("FIRST NAME", text: $firstName, prompt: Text("First name"))
                        .padding()
                        .background()
                        .cornerRadius(10)
                        .frame(width: textFieldWidth, height: 50, alignment: .center)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.bottom, 5)
                    TextField("LAST NAME", text: $LastName, prompt: Text("Last name")).padding()
                        .background()
                        .cornerRadius(10)
                        .frame(width: textFieldWidth, height: 50, alignment: .center)
                        .opacity(0.5)
                        .foregroundColor(.oldPrimaryColor)
                        .font(.title2)
                        .padding(.bottom, 5)
                    Button {
                        print(firstName)
                        print(LastName)
                    } label: {
                        Text("Login")
                            .padding()
                            .foregroundColor(.black)
                    }.frame(width: textFieldWidth, height: 50, alignment: .center)
                        .background(Color.pink)
                        .opacity(0.8)
                        .cornerRadius(10)
                }
            }
        }
        
    }

  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension CGImage {
    static let logo = UIImage(named: "logo")
}
