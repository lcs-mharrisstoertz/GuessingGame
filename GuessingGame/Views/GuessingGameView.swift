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
    @State var guess: Double = 0
    
    // The secret target that the user is trying to guess
    @State var target = Int.random(in: 0...100)
    
    // What feedback to provide the user with
    @State var feedback = ""
    
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            
            // Collect the user's input using a Slider
            Slider(value: $guess, in: 0...100, label: { Text("choose your number")}, minimumValueLabel: {Text("0")}, maximumValueLabel: {Text("100")})
            
            // Show the user's input to them using a Text view
            Text("\(guess.formatted(.number.precision(.fractionLength(0))))")
            
            // Let the user check to see if their current guess is correct
            Button(action: {
                
                // Convert the user's input, which is a Double, into an Int
                let guessAsInteger = Int(guess)
                
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
