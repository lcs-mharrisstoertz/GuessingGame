//
//  GuessingGameView.swift
//  GuessingGame
//
//  Created by Russell Gordon on 2021-11-30.
//

import SwiftUI

struct GuessingGameView: View {
    
    // MARK: Stored properties
    
    // The input collected from the Slider
    @State var guess = ""
    
    // The secret target that the user is trying to guess
    @State var target = Int.random(in: 0...100)
    
    // What feedback to provide the user with
    @State var feedback = ""
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Collect the user's input using a Slider
            TextField("Enter a length...", text: $guess)
                .font(.title2)
            
            // Let the user check to see if their current guess is correct
            Button(action: {
                
                // Convert the user's input, which is a Double, into an Int
                guard let guessAsInteger = Int(guess) else {
                    feedback = "Please enter a integer between 1 and 100"
                    return
                }
                
              
                
                // Compare the user's guess to the target and give appropriate feedback
                if guessAsInteger < target{
                    feedback = "Guess higher!"
                }
                if guessAsInteger > target{
                    feedback = "Guess lower!"
                }
                if guessAsInteger == target{
                    feedback = "You guessed the number!"
                }
                
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
            // Show the feedback to the user
            Text(feedback)
                .font(.title3)
                .italic()
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Guessing Game")
        
    }
}

struct GuessingGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessingGameView()
        }
    }
}
