//
//  ContentView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 31/05/22.
//

import SwiftUI


struct RestaurantListView: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    var body: some View {
        List{
            ForEach(restaurantNames.indices , id : \.self){index in
                VerticalView(imageName: restaurantNames[index], name: restaurantNames[index], type: restaurantTypes[index], location: restaurantLocations[index])
                
            }
            .listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

struct VerticalView : View{
    var imageName: String
    var name : String
    var type : String
    var location : String
    @State private var showOption = false
    @State private var showError = false
    var body : some View {
        VStack(alignment:.leading,spacing: 10){
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height:200)
                .cornerRadius(20)
            VStack(alignment:.leading){
                Text(name)
                    .font(.system(.title2, design: .rounded))
                Text(type)
                    .font(.system(.body, design: .rounded))
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
            }
            
        }
        .alert(isPresented:$showError){
            Alert(title: Text("No yet avaiable"),
                  message: Text("Sorry , this feature is not available yet. Please reatry later"),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
        .onTapGesture {
            showOption.toggle()
        }.actionSheet(isPresented: $showOption){
            ActionSheet(title: Text("What do you want to do"),message: nil,
                        buttons:[.default(Text("Reserve  a Table")){self.showError.toggle()},
                                 .default(Text("Mark as Favorite")){},
                                 .cancel()])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        RestaurantListView().preferredColorScheme(.dark)
    }
}
