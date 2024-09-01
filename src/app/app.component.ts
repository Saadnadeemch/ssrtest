import { Component } from '@angular/core';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'animoviback';
  
  safeURL: SafeResourceUrl="https://mega.nz/embed/7yYxVbaI#FNP37dlLo-_ly0ZoY3_AFXkGho_6byjeTAvEJMa_iTs"

  constructor(private sanitizer: DomSanitizer) {}

  ngOnInit(): void {
  }


}
