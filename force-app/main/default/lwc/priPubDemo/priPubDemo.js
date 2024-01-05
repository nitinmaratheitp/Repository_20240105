import { LightningElement, api } from 'lwc';

export default class priPubDemo extends  LightningElement {
    Industry = 'Private Market';
    @api recordId;
}