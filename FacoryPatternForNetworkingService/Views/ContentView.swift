//
//  ContentView.swift
//  FacoryPatternForNetworkingService
//
//  Created by Michelle Grover on 3/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm: String = ""
        @State private var acronyms: AcronymObject = []
        let networkingService = NetworkingServiceFactory.makeNetworkingService()
        
    var body: some View {
        VStack {
                    TextField("Enter acronym", text: $searchTerm, onCommit: {
                        fetchAcronyms()
                    })
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                        
            HStack {
                Button {
                    fetchAcronyms(for: "al")
                } label: {
                    Text("al")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button {
                    fetchAcronyms(for: "az")
                } label: {
                    Text("az")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Button {
                    fetchAcronyms(for: "io")
                } label: {
                    Text("io")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Button {
                    fetchAcronyms(for: "il")
                } label: {
                    Text("il")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
            }
            
                    Spacer()
                        .frame(height:20)
            
                    
                    if !acronyms.isEmpty {
                        List(acronyms, id: \.sf) { acronym in
                            ForEach(acronym.lfs, id: \.lf) { lf in
                                Text(lf.lf)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                    Spacer()
                        
                    
                    
                }
        Spacer()
    }
    
    private func fetchAcronyms() {
            networkingService.fetchAcronyms(for: searchTerm) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let acronyms):
                        self.acronyms = acronyms
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
    
    private func fetchAcronyms(for searchVal:String) {
        networkingService.fetchAcronyms(for: searchVal) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let acronyms):
                    self.acronyms = acronyms
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
