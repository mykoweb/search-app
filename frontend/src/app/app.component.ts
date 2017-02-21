import { Component } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'World Wide Food Search';
  foods;

  /*
  constructor(private http: Http) {
    http.get('http://localhost:3000/foods/search?name[]=apple&name[]=fish&name[]=apple')
        .subscribe(res => this.foods = res.json());
  }
  */

  constructor(private http: Http) {
    this.http = http;
  }

  searchFood(searchTerm: HTMLInputElement, categoryTerm: HTMLSelectElement): void {
    var names = searchTerm.value.split(/[\s,]+/);
    var namesQueryString = '';

    if (names.length === 1) {
      namesQueryString = 'name=' + names[0];
    } else {
      namesQueryString = 'name[]=' + names[0];
      for (var i = 1; i < names.length; i++) {
        namesQueryString += '&name[]=' + names[i];
      }
    }

    // var apiLink = 'http://localhost:3000/foods/search?'
    // + searchTerm.value + '&category=' + categoryTerm.value;
    var apiLink = 'http://localhost:3000/foods/search?'
                  + namesQueryString + '&category=' + categoryTerm.value;

    this.http.request(apiLink)
        .subscribe(res => this.foods = res.json());
  }
}
