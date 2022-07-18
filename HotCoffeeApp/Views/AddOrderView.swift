

import SwiftUI

struct AddOrderView: View {
    
    @Binding var isPresented: Bool
    @State var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        
        NavigationView {
        
        Group {
        
        VStack {
            
            TextField("Enter name", text: self.$addOrderVM.name)
            
            Picker(selection: self.$addOrderVM.type, label: Text("")) {
                Text("Cappuccino").tag("cap")
                Text("Regular").tag("reg")
                Text("Expresso").tag("ex")
            }.pickerStyle(SegmentedPickerStyle())
            
            Button("Place Order") {
                // place order
                self.addOrderVM.saveOrder()
               // self.isPresented = false
                
            }.padding(8)
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
            
        }
        }.padding()
        
            
            .navigationBarTitle("Add Order")
        }
    }
}

#if DEBUG
struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
#endif
