

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.orderListVM = OrderListViewModel()
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(orderVM)
        }
    }
    
    var body: some View {
       
        NavigationView {
        
        List {
            
            ForEach(self.orderListVM.orders, id: \.name) { order in
                HStack {
                    Image(order.type)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    
                    Text(order.name)
                        .font(.largeTitle)
                        .padding([.leading], 10)
                    
                }
            }.onDelete(perform: delete)
            
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            print("ONDISMISS")
            self.orderListVM.fetchAllOrders()
        }, content: {
            AddOrderView(isPresented: self.$isPresented)
        })
        .navigationBarTitle("Orders")
        .navigationBarItems(trailing: Button("Add New Order") {
            self.isPresented = true
        })
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
