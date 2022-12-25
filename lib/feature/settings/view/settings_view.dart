import 'package:finance_bank_app/core/base/view/base_view.dart';
import 'package:finance_bank_app/feature/settings/view_model/settings_view_model.dart';
import 'package:finance_bank_app/product/components/app_bar/custom_app_bar.dart';
import 'package:finance_bank_app/product/components/icon_button/custom_icon_button.dart';
import 'package:finance_bank_app/product/components/text_field/custom_text_field.dart';
import 'package:finance_bank_app/product/constants/enums/asset_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  String get _buildAppbarTitle => 'Settings';

  String get _buildSearchHintText => 'Search in Settings.';

  String get _profileTitle => 'Profil';

  String get _profileMenuPersonal => 'Personal Information';

  String get _profileMenuMessages => 'Messages';

  String get _preferencesTitle => 'Tercihler';

  String get _preferencesMenuProduct => 'Product Preferences';

  String get _preferencesMenuNotification => 'Notification Settings';

  String get _preferencesMenuQr => 'QR Settings';

  String get _otherTitle => 'Diğer';

  String get _otherDefinitions => 'Definitions';

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (viewModel) {
        viewModel
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      },
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: _buildAppbarTitle,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<SettingsViewModel>(
          builder: (context, viewModel, child) => Column(
            children: [
              _buildSearch(viewModel),
              if (viewModel.search.isEmpty ||
                  _profileTitle
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _profileMenuPersonal
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _profileMenuMessages
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase())) ...[
                _buildActionTitle(_profileTitle),
                _buildActionsMenu(
                  _profileMenuPersonal,
                  SvgAssets.profilePersonal,
                ),
                _buildActionsMenu(
                  _profileMenuMessages,
                  SvgAssets.profileMessages,
                ),
              ],
              if (viewModel.search.isEmpty ||
                  _preferencesTitle
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _preferencesMenuProduct
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _preferencesMenuNotification
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _preferencesMenuQr
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase())) ...[
                _buildActionTitle(_preferencesTitle),
                _buildActionsMenu(
                  _preferencesMenuProduct,
                  SvgAssets.preferencesProduct,
                ),
                _buildActionsMenu(
                  _preferencesMenuNotification,
                  SvgAssets.preferencesNotification,
                ),
                _buildActionsMenu(
                  _preferencesMenuQr,
                  SvgAssets.preferencesQr,
                ),
              ],
              if (viewModel.search.isEmpty ||
                  _otherTitle
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase()) ||
                  _otherDefinitions
                      .toLowerCase()
                      .contains(viewModel.search.toLowerCase())) ...[
                _buildActionTitle(_otherTitle),
                _buildActionsMenu(
                  _otherDefinitions,
                  SvgAssets.otherDefinition,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch(SettingsViewModel viewModel) {
    return FadeInDown(
      child: CustomTextField(
        hintText: _buildSearchHintText,
        onChanged: viewModel.setSearch,
      ),
    );
  }

  Widget _buildActionTitle(String title) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(96, 112, 143, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsMenu(String title, SvgAssets icon) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListTile(
          leading: CustomIconButton(
            width: 50,
            height: 50,
            padding: 0,
            child: SvgPicture.asset(
              icon.path,
            ),
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
