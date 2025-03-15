/**
 * Bootstrap Table English translation
 * Author: Translated from Chinese by Trae AI
 */
$.fn.bootstrapTable.locales['en-US'] = {
  formatShowSearch: function formatShowSearch() {
    return 'Hide/Show Search';
  },
  formatPageGo: function formatPageGo() {
    return 'Go';
  },
  formatCopyRows: function formatCopyRows() {
    return 'Copy Rows';
  },
  formatPrint: function formatPrint() {
    return 'Print';
  },
  formatLoadingMessage: function formatLoadingMessage() {
    return 'Loading data, please wait...';
  },
  formatRecordsPerPage: function formatRecordsPerPage(pageNumber) {
    return `Display ${pageNumber} records per page`;
  },
  formatShowingRows: function formatShowingRows(pageFrom, pageTo, totalRows, totalNotFiltered) {
    if (totalNotFiltered!== undefined && totalNotFiltered > 0 && totalNotFiltered > totalRows) {
      return `Showing records from ${pageFrom} to ${pageTo}, a total of ${totalRows} records (filtered from ${totalNotFiltered} total records)`;
    }
    return `Showing records from ${pageFrom} to ${pageTo}, a total of ${totalRows} records`;
  },
  formatSRPaginationPreText: function formatSRPaginationPreText() {
    return 'Previous Page';
  },
  formatSRPaginationPageText: function formatSRPaginationPageText(page) {
    return `Page ${page}`;
  },
  formatSRPaginationNextText: function formatSRPaginationNextText() {
    return 'Next Page';
  },
  formatDetailPagination: function formatDetailPagination(totalRows) {
    return `A total of ${totalRows} records`;
  },
  formatClearSearch: function formatClearSearch() {
    return 'Clear Filter';
  },
  formatSearch: function formatSearch() {
    return 'Search';
  },
  formatNoMatches: function formatNoMatches() {
    return 'No matching records found';
  },
  formatPaginationSwitch: function formatPaginationSwitch() {
    return 'Hide/Show Pagination';
  },
  formatPaginationSwitchDown: function formatPaginationSwitchDown() {
    return 'Show Pagination';
  },
  formatPaginationSwitchUp: function formatPaginationSwitchUp() {
    return 'Hide Pagination';
  },
  formatRefresh: function formatRefresh() {
    return 'Refresh';
  },
  formatToggle: function formatToggle() {
    return 'Toggle';
  },
  formatToggleOn: function formatToggleOn() {
    return 'Show Card View';
  },
  formatToggleOff: function formatToggleOff() {
    return 'Hide Card View';
  },
  formatColumns: function formatColumns() {
    return 'Columns';
  },
  formatColumnsToggleAll: function formatColumnsToggleAll() {
    return 'Toggle All';
  },
  formatFullscreen: function formatFullscreen() {
    return 'Fullscreen';
  },
  formatAllRows: function formatAllRows() {
    return 'All';
  },
  formatAutoRefresh: function formatAutoRefresh() {
    return 'Auto Refresh';
  },
  formatExport: function formatExport() {
    return 'Export Data';
  },
  formatJumpTo: function formatJumpTo() {
    return 'Jump';
  },
  formatAdvancedSearch: function formatAdvancedSearch() {
    return 'Advanced Search';
  },
  formatAdvancedCloseButton: function formatAdvancedCloseButton() {
    return 'Close';
  },
  formatFilterControlSwitch: function formatFilterControlSwitch() {
    return 'Hide/Show Filter Control';
  },
  formatFilterControlSwitchHide: function formatFilterControlSwitchHide() {
    return 'Hide Filter Control';
  },
  formatFilterControlSwitchShow: function formatFilterControlSwitchShow() {
    return 'Show Filter Control';
  }
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['en-US']);
