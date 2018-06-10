import { observes } from 'ember-addons/ember-computed-decorators';

export default Ember.Controller.extend({
  showDashboard: true,

  sorter(a, b, orderKey) {
    const priorityMap = {
        immediate: 0,
        urgent: 1,
        high: 2,
        normal: 3,
        low: 4
    }
    var aValue = 0;
    var bValue = 0;
    if (orderKey === 'priority') {
      aValue = priorityMap[a[orderKey]];
      bValue = priorityMap[b[orderKey]];
    }
    console.log("comparing " + aValue + ' to ' + bValue + ":")
    if (aValue < bValue) {
      return -1;
    }
    if (aValue > bValue) {
      return 1;
    }
    return 0;
  },

  // Take a look at https://git.io/vh2XE for a possible way of implementing table headers sort?
  order: null,
  ascending: null,
  @observes('order', 'ascending')
  _refreshTags() {
    var order = this.order;
    var ascending = this.ascending;
    console.log(order, ascending);
    // var order = this.order;
    // var ascending = this.ascending;
    // var tickets = Ember.get(this, 'model')
    var tickets = this.get('model');
    tickets.sort((a, b) => {
      var value = this.sorter(a, b, order);
      console.log("Compared " + a[order] + " to " + b[order] + " and got " + value)
      if (!ascending) {
        value = value * -1;
      }
      return value;
    })
    // console.log(tickets.map(t => t.title));
    var newTickets = [];
    tickets.map(t => newTickets.pushObject(t));
    this.set('model', newTickets);
  }
});

