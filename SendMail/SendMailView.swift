//
//  SendMailView.swift
//  SendMail
//
//  Created by Jan Hovland on 10/10/2020.
//

/// Dokumentasjon: https://stackoverflow.com/questions/56784722/swiftui-send-email

import SwiftUI
import MessageUI

struct SendMailView: View {
    
    @State var isShowingMailView = false
    @State var toRecipients: [String] = []
    @State var subject: String = ""
    @State var name: String = ""
    @State var messageBody: String = ""
    @State var result: Result<MFMailComposeResult, Error>? = nil

    var body: some View {
        
        VStack {
            if MFMailComposeViewController.canSendMail() {
                Button("Show mail view") {
                    toRecipients = ["jan.hovland@lyse.net"]
                    subject = "Fødselsdag hilsen"
                    name = "Olufine"
                    messageBody = "Gratulerer så mye med fødselsdagen din, " + name + ",🇳🇴 😀"
                    self.isShowingMailView.toggle()
                }
            } else {
                Text("Can't send emails from this device")
            }
        }
        .sheet(isPresented: $isShowingMailView) {
            MailView(isShowing: self.$isShowingMailView,
                     toRecipients: self.$toRecipients,
                     subject: self.$subject,
                     messageBody: self.$messageBody,
                     result: self.$result)
        }
        
    }
    
}

