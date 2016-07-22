import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:negation_marker/article_service.dart';
import 'package:negation_marker/paste/paste_component.dart';
import 'package:negation_marker/edit/edit_component.dart';
import 'package:negation_marker/export/export_component.dart';

@Component(
    selector: 'main-app',
    templateUrl: 'app_component.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ArticleService, ROUTER_PROVIDERS]
)
@RouteConfig(const [
  const Route(
      path: '/paste',
      name: 'Paste',
      component: PasteComponent,
      useAsDefault: true),
  const Route(
      path: '/edit',
      name: 'Edit',
      component: EditComponent),
  const Route(
      path: '/export',
      name: 'Export',
      component: ExportComponent)
])
class AppComponent {}