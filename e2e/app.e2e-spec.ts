import { NegationMarkerPage } from './app.po';

describe('negation-marker App', function() {
  let page: NegationMarkerPage;

  beforeEach(() => {
    page = new NegationMarkerPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
