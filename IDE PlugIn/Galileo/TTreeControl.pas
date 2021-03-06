type
  TTreeControl=class(TCustomTreeControl)
  private
   FImageChangeLink    :TChangeLink;
   FStateChangeLink    :TChangeLink;
   FStateImages        :TImageList;
   FImages             :TImageList;
   FOnDropFiles        :TDropFilesEvent;
   FOnHintShow         :THintShowEvent;
   FEnableDropFiles    :Boolean;
   FShouldValidate     :Boolean;
   ftimer              :TTimer;
   FModel              :IGraphModel;
   FWriteModel         :IWritableGraphModel;
   FViewManager        :IGraphViewManager;
   FSelection          :IWritableGraphSelection;
   FDragSelection      :IWritableGraphSelection;
   FDragSelectionMgr   :IGraphSelectionListener;
   FReadOnly           :Boolean;
   FSelectAnchor       :TNodeState;
   FSubfocus           :TNodeState;
   FLastSubfocus       :TNodeState;
   feditlocation       :TNodeState;
   FSubfocusChecked    :Boolean;
   FEditor             :IItemEditor;
   FEndingEdit         :Boolean;
   FEditorNode         :TNodeState;
   FEditClickPoint     :TPoint;
   FSnapOrigin         :Boolean;
   FPostOnEndEdit      :Boolean;
   FExpandByDefault    :Boolean;
   FHasFocus           :Boolean;
   FDraggingOver       :Boolean;
   FShowFocus          :Boolean;
   FShowRoot           :Boolean;
   FShowRootLines      :Boolean;
   FUniformHeight      :Boolean;
   FCache              :THashtable;
   FFirstNode          :TNodeState;
   FRootNode           :TNodeState;
   FLastCalc           :TNodeState;
   FExpandedArrow      :TBitmap;
   FContractedArrow    :TBitmap;
   FStyle              :TTreeViewStyle;
   FScroller           :TScrollPane;
   FCanvasWidth        :Integer;
   FCanvasHeight       :Integer;
   FRepaintNodeTop     :Integer;
   FLineCount          :Integer;
   FInitialized        :Boolean;
   FPresetExpandList   :IInterfaceList;
   FPresetCollapseList :IInterfaceList;
   FDoubleBuffer       :Boolean;
   FEditInPlace        :Boolean;
   FAutoEdit           :Boolean;
   FHSnap              :Boolean;
   FLockSubfocus       :Boolean;
   FDragSubfocus       :Boolean;
   FBatchMode          :Boolean;
   FMargins            :TInsets;
   FLeftMargin         :Integer;
   FTopMargin          :Integer;
   FAlignment          :TAlignment;
   FBoxSize            :TDimension;
   FVgap               :Integer;
   FHIndent            :Integer;
   FItemOffset         :Integer;
   FMultiSelect        :Boolean;
   FTreeListeners      :TEventMulticaster;
   FSubfocusListeners  :TEventMulticaster;
   FKeyMulticaster     :IKeyMulticaster;
   FModelMulticaster   :IGraphModelMulticaster;
   FSelectionMulticaster:IGraphSelectionMulticaster;
   FDragSelectionMulticaster:IGraphSelectionMulticaster;
   FUpdateCount        :Integer;
   FBitmap             :TBitmap;
   FDoubleClicked      :Boolean;
   FItemPaintSite      :IItemPaintSite;
   FOnModelStructureChanged:TOnGraphModelEvent;
   FOnModelContentChanged:TOnGraphModelEvent;
   FOnSubfocusChanging :TOnGraphSubfocusEvent;
   FOnSubfocusChanged  :TOnGraphSubfocusEvent;
   FOnSelectionItemChanged:TOnGraphSelectionEvent;
   FOnSelectionChanged :TOnGraphSelectionEvent;
   FOnNodeExpanded     :TOnTreeEvent;
   FOnNodeCollapsed    :TOnTreeEvent;
   FInsets             :TInsets;
   FOnOverrideScrollRange:TOnOverrideScrollRangeEvent;
   FActionAdapter      :TActionMulticaster;
   FFocusAware         :Boolean;
   FFocusState         :TItemState;
   FOnActionPerformed  :TOnActionEvent;
   FCanvas             :TCanvas;
   FEventMask          :Integer;
   FComponentListener  :IComponentListener;
   FContainerListener  :IContainerListener;
   FFocusListener      :IFocusListener;
   FKeyListener        :IKeyListener;
   FMouseListener      :IMouseListener;
   FMouseMotionListener:IMouseMotionListener;
   FDragListener       :IDragListener;
   FOnComponentResized :TOnComponentEvent;
   FOnComponentMoved   :TOnComponentEvent;
   FOnComponentShown   :TOnComponentEvent;
   FOnComponentHidden  :TOnComponentEvent;
   FOnComponentAdded   :TOnContainerEvent;
   FOnComponentRemoved :TOnContainerEvent;
   FOnFocusGained      :TOnFocusEvent;
   FOnFocusLost        :TOnFocusEvent;
   FOnKeyPressed       :TOnKeyEvent;
   FOnKeyReleased      :TOnKeyEvent;
   FOnKeyTyped         :TOnKeyEvent;
   FOnMousePressed     :TOnMouseEvent;
   FOnMouseReleased    :TOnMouseEvent;
   FOnMouseClicked     :TOnMouseEvent;
   FOnMouseEntered     :TOnMouseEvent;
   FOnMouseExited      :TOnMouseEvent;
   FOnMouseMoved       :TOnMouseEvent;
   FOnMouseDragged     :TOnMouseEvent;
   FOnWindowOpened     :TOnWindowEvent;
   FOnWindowClosing    :TOnWindowEvent;
   FOnWindowClosed     :TOnWindowEvent;
   FOnWindowIconified  :TOnWindowEvent;
   FOnWindowDeiconified:TOnWindowEvent;
   FOnWindowActivated  :TOnWindowEvent;
   FOnWindowDeactivated:TOnWindowEvent;
   FOnItemStateChanged :TOnItemEvent;
   FOnAdjustmentValueChanged:TOnAdjustmentEvent;
   FOnTextValueChanged :TOnTextEvent;
   FOnDragEntered      :TOnDragEvent;
   FOnDragExited       :TOnDragEvent;
   FOnDragMoved        :TOnDragEvent;
   FOnDragDropped      :TOnDragEvent;
   FOnDragCancelled    :TOnDragEvent;
   FOnDragTargeted     :TOnDragEvent;
   FBorderStyle        :TBorderStyle;
   FAutoRangeCount     :Integer;
   FAutoScroll         :Boolean;
   FHorzScrollBar      :TControlScrollBar;
   FPanPoint           :TPoint;
   FUpdatingScrollBars :Boolean;
   FVertScrollBar      :TControlScrollBar;
   FAlignControlList   :TList;
   FAlignLevel         :Word;
   FBevelEdges         :TBevelEdges;
   FBevelInner         :TBevelCut;
   FBevelOuter         :TBevelCut;
   FBevelKind          :TBevelKind;
   FBevelWidth         :TBevelWidth;
   FBorderWidth        :TBorderWidth;
   FPadding            :TPadding;
   FBrush              :TBrush;
   FDockClients        :TList;
   FDockManager        :IDockManager;
   FImeMode            :TImeMode;
   FImeName            :TImeName;
   FParentWindow       :HWND;
   FTabList            :TList;
   FControls           :TList;
   FWinControls        :TList;
   FTabOrder           :Integer;
   FTabStop            :Boolean;
   FCtl3D              :Boolean;
   FShowing            :Boolean;
   FUseDockManager     :Boolean;
   FDockSite           :Boolean;
   FParentCtl3D        :Boolean;
   FParentDoubleBuffered:Boolean;
   FPerformingShowingChanged:Boolean;
   FOnDockDrop         :TDockDropEvent;
   FOnDockOver         :TDockOverEvent;
   FOnEnter            :TNotifyEvent;
   FOnExit             :TNotifyEvent;
   FOnGetSiteInfo      :TGetSiteInfoEvent;
   FOnKeyDown          :TKeyEvent;
   FOnKeyPress         :TKeyPressEvent;
   FOnKeyUp            :TKeyEvent;
   FOnUnDock           :TUnDockEvent;
   FOnAlignInsertBefore:TAlignInsertBeforeEvent;
   FOnAlignPosition    :TAlignPositionEvent;
   FMouseInClient      :Boolean;
   FMouseControl       :TControl;
   FTouchControl       :TControl;
   FDefWndProc         :Pointer;
   FHandle             :HWND;
   FObjectInstance     :Pointer;
   FParent             :TWinControl;
   FWindowProc         :TWndMethod;
   FLeft               :Integer;
   FTop                :Integer;
   FWidth              :Integer;
   FHeight             :Integer;
   FControlStyle       :TControlStyle;
   FControlState       :TControlState;
   FDesktopFont        :Boolean;
   FVisible            :Boolean;
   FEnabled            :Boolean;
   FParentFont         :Boolean;
   FParentColor        :Boolean;
   FAlign              :TAlign;
   FAutoSize           :Boolean;
   FDragMode           :TDragMode;
   FIsControl          :Boolean;
   FBiDiMode           :TBiDiMode;
   FParentBiDiMode     :Boolean;
   FAnchors            :TAnchors;
   FFont               :TFont;
   FActionLink         :TControlActionLink;
   FColor              :TColor;
   FConstraints        :TSizeConstraints;
   FMargins            :TMargins;
   FCursor             :TCursor;
   FDragCursor         :TCursor;
   FPopupMenu          :TPopupMenu;
   FHint               :string;
   FFontHeight         :Integer;
   FScalingFlags       :TScalingFlags;
   FShowHint           :Boolean;
   FParentShowHint     :Boolean;
   FDragKind           :TDragKind;
   FDockOrientation    :TDockOrientation;
   FHostDockSite       :TWinControl;
   FWheelAccumulator   :Integer;
   FUndockWidth        :Integer;
   FUndockHeight       :Integer;
   FLRDockWidth        :Integer;
   FTBDockHeight       :Integer;
   FFloatingDockSiteClass:TWinControlClass;
   FTouchManager       :TTouchManager;
   FOnCanResize        :TCanResizeEvent;
   FOnConstrainedResize:TConstrainedResizeEvent;
   FOnMouseDown        :TMouseEvent;
   FOnMouseMove        :TMouseMoveEvent;
   FOnMouseUp          :TMouseEvent;
   FOnDragDrop         :TDragDropEvent;
   FOnDragOver         :TDragOverEvent;
   FOnResize           :TNotifyEvent;
   FOnStartDock        :TStartDockEvent;
   FOnEndDock          :TEndDragEvent;
   FOnStartDrag        :TStartDragEvent;
   FOnEndDrag          :TEndDragEvent;
   FOnClick            :TNotifyEvent;
   FOnDblClick         :TNotifyEvent;
   FOnContextPopup     :TContextPopupEvent;
   FOnMouseActivate    :TMouseActivateEvent;
   FOnMouseLeave       :TNotifyEvent;
   FOnMouseEnter       :TNotifyEvent;
   FOnMouseWheel       :TMouseWheelEvent;
   FOnMouseWheelDown   :TMouseWheelUpDownEvent;
   FOnMouseWheelUp     :TMouseWheelUpDownEvent;
   FOnGesture          :TGestureEvent;
   FHelpType           :THelpType;
   FHelpKeyword        :string;
   FHelpContext        :THelpContext;
   FCustomHint         :TCustomHint;
   FParentCustomHint   :Boolean;
   FText               :PWideChar;
   FOwner              :TComponent;
   FName               :TComponentName;
   FTag                :NativeInt;
   FComponents         :TList;
   FFreeNotifies       :TList;
   FDesignInfo         :Integer;
   FComponentState     :TComponentState;
   FVCLComObject       :Pointer;
   FObservers          :TObservers;
   FSortedComponents   :TList;
   function GetDockClients(Index: Integer): TControl;
   function GetControl(Index: Integer): TControl;
   function GetComponent(AIndex: Integer): TComponent;
  protected
   FUpdateCount        :Integer;
   FRefCount           :Integer;
   FDoubleBuffered     :Boolean;
   FInImeComposition   :Boolean;
   FDesignSize         :TPoint;
   FAnchorMove         :Boolean;
   FAnchorRules        :TPoint;
   FAnchorOrigin       :TPoint;
   FOriginalParentSize :TPoint;
   FExplicitLeft       :Integer;
   FExplicitTop        :Integer;
   FExplicitWidth      :Integer;
   FExplicitHeight     :Integer;
   FReserved           :Pointer;
   FComponentStyle     :TComponentStyle;
  public
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure SetModel(Model: IGraphModel);
   function GetRoot: IGraphLocation;
   function Get(const Node: IGraphLocation): IInterface;
   function Find(const Data: IInterface): IGraphLocation;
   function SetRoot(Data: IInterface): IGraphLocation;
   function CanModify(Node: IGraphLocation): Boolean;
   procedure Put(Node: IGraphLocation; Data: IInterface);
   procedure Touched(Node: IGraphLocation);
   function IsVariableSize: Boolean;
   function AddChild(Parent: IGraphLocation; Data: IInterface): IGraphLocation;
   function InsertChild(Parent: IGraphLocation; AheadOf: IGraphLocation; Data: IInterface): IGraphLocation;
   procedure RemoveChildren(Parent: IGraphLocation);
   procedure Remove(Node: IGraphLocation);
   procedure RemoveAll;
   procedure EnableModelEvents(Enable: Boolean);
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure Refresh;
   function IsEditing: Boolean;
   function GetModel: IGraphModel;
   function GetWriteModel: IWritableGraphModel;
   procedure SetModel(Model: IGraphModel);
   procedure AddModelListener(const L: IGraphModelListener);
   procedure RemoveModelListener(const L: IGraphModelListener);
   function GetViewManager: IGraphViewManager;
   procedure SetViewManager(NewManager: IGraphViewManager);
   function GetSubfocus: IGraphLocation;
   procedure SetSubfocus(Subfocus: IGraphLocation);
   procedure AddNotify;
   procedure Paint2(Pg: TCanvas; const Origin: TPoint);
   function HitTest(XPos: Integer; YPos: Integer): IGraphLocation;
   function GetPreferredSize: TDimension;
   procedure AddTreeListener(L: ITreeListener);
   procedure RemoveTreeListener(L: ITreeListener);
   function GetSelection: IWritableGraphSelection;
   function IsExpanded(const Location: IGraphLocation): Boolean;
   procedure Expand(const Location: IGraphLocation);
   procedure Collapse(const Location: IGraphLocation);
   procedure StartEdit(Node: IGraphLocation);
   procedure EndEdit2;
   procedure EndEdit(Post: Boolean);
   procedure CancelEdit;
   function GetEditClickPoint: TPoint;
   procedure AddKeyListener(L: IKeyListener);
   procedure RemoveKeyListener(L: IKeyListener);
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure AddActionListener(L: IActionListener);
   procedure RemoveActionListener(L: IActionListener);
   procedure DoLayout;
   procedure DoLayout2;
   function GetViewportSize: TDimension;
   function GetScrollPosition: TPoint;
   procedure SetScrollPosition(X: Integer; Y: Integer);
   function GetInsets: TInsets;
   function GetMinimumSize: TDimension;
   function IsFocusTraversable: Boolean;
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure AddNotify;
   function GetBackground: TColor;
   procedure SetBackground(Value: TColor);
   function GetForeground: TColor;
   procedure SetForeground(Value: TColor);
   function GetFont: TFont;
   procedure SetFont(Value: TFont);
   function GetAlignment: TAlignment;
   function GetItemMargins: TInsets;
   function IsShowing: Boolean;
   procedure Add(Child: TKomponent);
   procedure Remove(Child: TKomponent);
   function GetGraphics: TCanvas;
   function IsEnabled: Boolean;
   procedure RequestFocus;
   function GetPreferredSize: TDimension;
   function IsVisible: Boolean;
   procedure DispatchEvent(E: IAWTEvent);
   procedure AddComponentListener(L: IComponentListener);
   procedure RemoveComponentListener(L: IComponentListener);
   procedure AddContainerListener(L: IContainerListener);
   procedure RemoveContainerListener(L: IContainerListener);
   procedure AddFocusListener(L: IFocusListener);
   procedure RemoveFocusListener(L: IFocusListener);
   procedure AddKeyListener(L: IKeyListener);
   procedure RemoveKeyListener(L: IKeyListener);
   procedure AddMouseListener(L: IMouseListener);
   procedure RemoveMouseListener(L: IMouseListener);
   procedure AddMouseMotionListener(L: IMouseMotionListener);
   procedure RemoveMouseMotionListener(L: IMouseMotionListener);
   procedure AddDragListener(L: IDragListener);
   procedure RemoveDragListener(L: IDragListener);
   constructor Create(AOwner: TComponent);
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure DisableAutoRange;
   procedure EnableAutoRange;
   procedure ScrollInView(AControl: TControl);
   constructor Create(AOwner: TComponent);
   constructor CreateParented(ParentWindow: HWND);
   class function CreateParentedControl(ParentWindow: HWND): TWinControl;
   class destructor Destroy;
   procedure Broadcast(var Message);
   function CanFocus: Boolean;
   function ContainsControl(Control: TControl): Boolean;
   function ControlAtPos(const Pos: TPoint; AllowDisabled: Boolean; AllowWinControls: Boolean; AllLevels: Boolean): TControl;
   procedure DefaultHandler(var Message);
   procedure DisableAlign;
   procedure DockDrop(Source: TDragDockObject; X: Integer; Y: Integer);
   procedure EnableAlign;
   function FindChildControl(const ControlName: string): TControl;
   procedure FlipChildren(AllLevels: Boolean);
   function Focused: Boolean;
   procedure GetChildren(Proc: TGetChildProc = procedure(Child: TComponent) of object; Root: TComponent);
   procedure GetTabControlList(List: TList);
   procedure GetTabOrderList(List: TList);
   function HandleAllocated: Boolean;
   procedure HandleNeeded;
   procedure InsertControl(AControl: TControl);
   procedure Invalidate;
   procedure PaintTo(DC: HDC; X: Integer; Y: Integer);
   procedure PaintTo(Canvas: TCanvas; X: Integer; Y: Integer);
   function PreProcessMessage(var Msg: tagMSG): Boolean;
   procedure RemoveControl(AControl: TControl);
   procedure Realign;
   procedure Repaint;
   procedure ScaleBy(M: Integer; D: Integer);
   procedure ScrollBy(DeltaX: Integer; DeltaY: Integer);
   procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer);
   procedure SetDesignVisible(Value: Boolean);
   procedure SetFocus;
   procedure Update;
   procedure UpdateControlState;
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure BeginDrag(Immediate: Boolean; Threshold: Integer);
   procedure BringToFront;
   function ClientToScreen(const Point: TPoint): TPoint;
   function ClientToParent(const Point: TPoint; AParent: TWinControl): TPoint;
   procedure Dock(NewDockSite: TWinControl; ARect: TRect);
   function Dragging: Boolean;
   procedure DragDrop(Source: TObject; X: Integer; Y: Integer);
   function DrawTextBiDiModeFlags(Flags: Integer): Integer;
   function DrawTextBiDiModeFlagsReadingOnly: Integer;
   procedure EndDrag(Drop: Boolean);
   function GetControlsAlignment: TAlignment;
   function GetParentComponent: TComponent;
   function HasParent: Boolean;
   procedure Hide;
   procedure InitiateAction;
   procedure Invalidate;
   procedure MouseWheelHandler(var Message: TMessage);
   function IsRightToLeft: Boolean;
   function ManualDock(NewDockSite: TWinControl; DropControl: TControl; ControlSide: TAlign): Boolean;
   function ManualFloat(ScreenPos: TRect): Boolean;
   function Perform(Msg: Cardinal; WParam: NativeUInt; LParam: NativeInt): NativeInt;
   procedure Refresh;
   procedure Repaint;
   function ReplaceDockedControl(Control: TControl; NewDockSite: TWinControl; DropControl: TControl; ControlSide: TAlign): Boolean;
   function ScreenToClient(const Point: TPoint): TPoint;
   function ParentToClient(const Point: TPoint; AParent: TWinControl): TPoint;
   procedure SendToBack;
   procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer);
   procedure SetDesignVisible(Value: Boolean);
   procedure SetParentComponent(Value: TComponent);
   procedure Show;
   procedure Update;
   function UseRightToLeftAlignment: Boolean;
   function UseRightToLeftReading: Boolean;
   function UseRightToLeftScrollBar: Boolean;
   procedure DefaultHandler(var Message);
   function GetTextBuf(Buffer: PWideChar; BufSize: Integer): Integer;
   function GetTextLen: Integer;
   function Perform(Msg: Cardinal; WParam: NativeUInt; LParam: PWideChar): NativeInt;
   function Perform(Msg: Cardinal; WParam: NativeUInt; var LParam: TRect): NativeInt;
   procedure SetTextBuf(Buffer: PWideChar);
   constructor Create(AOwner: TComponent);
   class destructor Destroy;
   procedure BeforeDestruction;
   procedure DestroyComponents;
   procedure Destroying;
   function ExecuteAction(Action: TBasicAction): Boolean;
   function FindComponent(const AName: string): TComponent;
   procedure FreeNotification(AComponent: TComponent);
   procedure RemoveFreeNotification(AComponent: TComponent);
   procedure FreeOnRelease;
   function GetEnumerator: TComponentEnumerator;
   function GetParentComponent: TComponent;
   function GetNamePath: string;
   function HasParent: Boolean;
   procedure InsertComponent(AComponent: TComponent);
   procedure RemoveComponent(AComponent: TComponent);
   procedure SetSubComponent(IsSubComponent: Boolean);
   function SafeCallException(ExceptObject: TObject; ExceptAddr: Pointer): HRESULT;
   function UpdateAction(Action: TBasicAction): Boolean;
   function IsImplementorOf(const I: IInterface): Boolean;
   function ReferenceInterface(const I: IInterface; Operation: TOperation): Boolean;
   class destructor Destroy;
   procedure Assign(Source: TPersistent);
   function GetNamePath: string;
   constructor Create;
   procedure Free;
   class function InitInstance(Instance: Pointer): TObject;
   procedure CleanupInstance;
   function ClassType: TClass;
   class function ClassName: string;
   class function ClassNameIs(const Name: string): Boolean;
   class function ClassParent: TClass;
   class function ClassInfo: Pointer;
   class function InstanceSize: Integer;
   class function InheritsFrom(AClass: TClass): Boolean;
   class function MethodAddress(const Name: ShortString): Pointer;
   class function MethodAddress(const Name: string): Pointer;
   class function MethodName(Address: Pointer): string;
   class function QualifiedClassName: string;
   function FieldAddress(const Name: ShortString): Pointer;
   function FieldAddress(const Name: string): Pointer;
   function GetInterface(const IID: TGUID; out Obj): Boolean;
   class function GetInterfaceEntry(const IID: TGUID): PInterfaceEntry;
   class function GetInterfaceTable: PInterfaceTable;
   class function UnitName: string;
   class function UnitScope: string;
   function Equals(Obj: TObject): Boolean;
   function GetHashCode: Integer;
   function ToString: string;
   function SafeCallException(ExceptObject: TObject; ExceptAddr: Pointer): HRESULT;
   procedure AfterConstruction;
   procedure BeforeDestruction;
   procedure Dispatch(var Message);
   procedure DefaultHandler(var Message);
   class function NewInstance: TObject;
   procedure FreeInstance;
   class destructor Destroy;
   property OnClick: TNotifyEvent;
   property OnDblClick: TNotifyEvent;
   property OnDragDrop: TDragDropEvent;
   property OnDragOver: TDragOverEvent;
   property OnEndDrag: TEndDragEvent;
   property OnEnter: TNotifyEvent;
   property OnExit: TNotifyEvent;
   property OnMouseDown: TMouseEvent;
   property OnMouseMove: TMouseMoveEvent;
   property OnMouseUp: TMouseEvent;
   property OnResize: TNotifyEvent;
   property OnStartDrag: TStartDragEvent;
   property Images: TImageList;
   property StateImages: TImageList;
   property TabStop: Boolean;
   property ParentColor: Boolean;
   property ViewManager: IGraphViewManager;
   property Model: IGraphModel;
   property ReadOnly: Boolean;
   property PostOnEndEdit: Boolean;
   property ShowFocus: Boolean;
   property DragSubfocus: Boolean;
   property SnapOrigin: Boolean;
   property HorzSnap: Boolean;
   property DoubleBuffer: Boolean;
   property EditInPlace: Boolean;
   property AutoEdit: Boolean;
   property Editing: Boolean;
   property BatchMode: Boolean;
   property ShowRoot: Boolean;
   property ShowRootLines: Boolean;
   property Selection: IWritableGraphSelection;
   property DragSelection: IWritableGraphSelection;
   property Subfocus: IGraphLocation;
   property ExpandByDefault: Boolean;
   property Style: TTreeViewStyle;
   property Alignment: TAlignment;
   property ItemMargins: TInsets;
   property LeftMargin: Integer;
   property TopMargin: Integer;
   property BoxWidth: Integer;
   property BoxHeight: Integer;
   property VertGap: Integer;
   property Indent: Integer;
   property ItemOffset: Integer;
   property MultiSelect: Boolean;
   property OnComponentResized: TOnComponentEvent;
   property OnComponentMoved: TOnComponentEvent;
   property OnComponentShown: TOnComponentEvent;
   property OnComponentHidden: TOnComponentEvent;
   property OnComponentAdded: TOnContainerEvent;
   property OnComponentRemoved: TOnContainerEvent;
   property OnFocusGained: TOnFocusEvent;
   property OnFocusLost: TOnFocusEvent;
   property OnKeyPressed: TOnKeyEvent;
   property OnKeyReleased: TOnKeyEvent;
   property OnKeyTyped: TOnKeyEvent;
   property OnMousePressed: TOnMouseEvent;
   property OnMouseReleased: TOnMouseEvent;
   property OnMouseClicked: TOnMouseEvent;
   property OnMouseEntered: TOnMouseEvent;
   property OnMouseExited: TOnMouseEvent;
   property OnMouseMoved: TOnMouseEvent;
   property OnMouseDragged: TOnMouseEvent;
   property OnActionPerformed: TOnActionEvent;
   property OnItemStateChanged: TOnItemEvent;
   property OnAdjustmentValueChanged: TOnAdjustmentEvent;
   property OnTextValueChanged: TOnTextEvent;
   property OnDragEntered: TOnDragEvent;
   property OnDragExited: TOnDragEvent;
   property OnDragMoved: TOnDragEvent;
   property OnDragDropped: TOnDragEvent;
   property OnDragCancelled: TOnDragEvent;
   property OnDragTargeted: TOnDragEvent;
   property OnModelStructureChanged: TOnGraphModelEvent;
   property OnModelContentChanged: TOnGraphModelEvent;
   property OnSubfocusChanging: TOnGraphSubfocusEvent;
   property OnSubfocusChanged: TOnGraphSubfocusEvent;
   property OnSelectionItemChanged: TOnGraphSelectionEvent;
   property OnSelectionChanged: TOnGraphSelectionEvent;
   property OnNodeExpanded: TOnTreeEvent;
   property OnNodeCollapsed: TOnTreeEvent;
   property OnHintShow: THintShowEvent;
   property DockClientCount: Integer;
   property DockSite: Boolean;
   property DockManager: IDockManager;
   property DoubleBuffered: Boolean;
   property AlignDisabled: Boolean;
   property MouseInClient: Boolean;
   property VisibleDockClientCount: Integer;
   property Brush: TBrush;
   property ControlCount: Integer;
   property Handle: HWND;
   property Padding: TPadding;
   property ParentDoubleBuffered: Boolean;
   property ParentWindow: HWND;
   property Showing: Boolean;
   property TabOrder: TTabOrder;
   property TabStop: Boolean;
   property UseDockManager: Boolean;
   property Enabled: Boolean;
   property Action: TBasicAction;
   property Align: TAlign;
   property Anchors: TAnchors;
   property BiDiMode: TBiDiMode;
   property BoundsRect: TRect;
   property ClientHeight: Integer;
   property ClientOrigin: TPoint;
   property ClientRect: TRect;
   property ClientWidth: Integer;
   property Constraints: TSizeConstraints;
   property ControlState: TControlState;
   property ControlStyle: TControlStyle;
   property DockOrientation: TDockOrientation;
   property ExplicitLeft: Integer;
   property ExplicitTop: Integer;
   property ExplicitWidth: Integer;
   property ExplicitHeight: Integer;
   property Floating: Boolean;
   property FloatingDockSiteClass: TWinControlClass;
   property HostDockSite: TWinControl;
   property LRDockWidth: Integer;
   property ShowHint: Boolean;
   property TBDockHeight: Integer;
   property Touch: TTouchManager;
   property UndockHeight: Integer;
   property UndockWidth: Integer;
   property Visible: Boolean;
   property WindowProc: TWndMethod;
   property Parent: TWinControl;
   property OnGesture: TGestureEvent;
   property ComObject: IInterface;
   property ComponentCount: Integer;
   property ComponentIndex: Integer;
   property ComponentState: TComponentState;
   property ComponentStyle: TComponentStyle;
   property DesignInfo: Integer;
   property Owner: TComponent;
   property VCLComObject: Pointer;
   property Observers: TObservers;
  published
   property Align: TAlign;
   property BevelEdges: TBevelEdges;
   property BevelInner: TBevelCut;
   property BevelOuter: TBevelCut;
   property BevelKind: TBevelKind;
   property BevelWidth: TBevelWidth;
   property BorderStyle: TBorderStyle;
   property BorderWidth: TBorderWidth;
   property DragCursor: TCursor;
   property DragMode: TDragMode;
   property Enabled: Boolean;
   property Color: TColor;
   property Ctl3D: Boolean;
   property Font: TFont;
   property ParentColor: Boolean;
   property ParentCtl3D: Boolean;
   property ParentFont: Boolean;
   property ParentShowHint: Boolean;
   property PopupMenu: TPopupMenu;
   property ShowHint: Boolean;
   property TabOrder: TTabOrder;
   property TabStop: Boolean;
   property Visible: Boolean;
   property OnClick: TNotifyEvent;
   property OnDblClick: TNotifyEvent;
   property OnDragDrop: TDragDropEvent;
   property OnDragOver: TDragOverEvent;
   property OnEndDrag: TEndDragEvent;
   property OnEnter: TNotifyEvent;
   property OnExit: TNotifyEvent;
   property OnMouseDown: TMouseEvent;
   property OnMouseMove: TMouseMoveEvent;
   property OnMouseUp: TMouseEvent;
   property OnResize: TNotifyEvent;
   property OnStartDrag: TStartDragEvent;
   property Images: TImageList;
   property StateImages: TImageList;
   property ReadOnly: Boolean;
   property PostOnEndEdit: Boolean;
   property ShowFocus: Boolean;
   property DragSubfocus: Boolean;
   property SnapOrigin: Boolean;
   property HorzSnap: Boolean;
   property DoubleBuffer: Boolean;
   property EditInPlace: Boolean;
   property AutoEdit: Boolean;
   property Editing: Boolean;
   property BatchMode: Boolean;
   property ShowRoot: Boolean;
   property ShowRootLines: Boolean;
   property ExpandByDefault: Boolean;
   property Style: TTreeViewStyle;
   property Alignment: TAlignment;
   property ItemMargins: TInsets;
   property LeftMargin: Integer;
   property TopMargin: Integer;
   property BoxWidth: Integer;
   property BoxHeight: Integer;
   property VertGap: Integer;
   property Indent: Integer;
   property ItemOffset: Integer;
   property MultiSelect: Boolean;
   property OnComponentResized: TOnComponentEvent;
   property OnComponentMoved: TOnComponentEvent;
   property OnComponentShown: TOnComponentEvent;
   property OnComponentHidden: TOnComponentEvent;
   property OnComponentAdded: TOnContainerEvent;
   property OnComponentRemoved: TOnContainerEvent;
   property OnFocusGained: TOnFocusEvent;
   property OnFocusLost: TOnFocusEvent;
   property OnKeyPressed: TOnKeyEvent;
   property OnKeyReleased: TOnKeyEvent;
   property OnKeyTyped: TOnKeyEvent;
   property OnMousePressed: TOnMouseEvent;
   property OnMouseReleased: TOnMouseEvent;
   property OnMouseClicked: TOnMouseEvent;
   property OnMouseEntered: TOnMouseEvent;
   property OnMouseExited: TOnMouseEvent;
   property OnMouseMoved: TOnMouseEvent;
   property OnMouseDragged: TOnMouseEvent;
   property OnActionPerformed: TOnActionEvent;
   property OnItemStateChanged: TOnItemEvent;
   property OnAdjustmentValueChanged: TOnAdjustmentEvent;
   property OnTextValueChanged: TOnTextEvent;
   property OnDragEntered: TOnDragEvent;
   property OnDragExited: TOnDragEvent;
   property OnDragMoved: TOnDragEvent;
   property OnDragDropped: TOnDragEvent;
   property OnDragCancelled: TOnDragEvent;
   property OnDragTargeted: TOnDragEvent;
   property OnModelStructureChanged: TOnGraphModelEvent;
   property OnModelContentChanged: TOnGraphModelEvent;
   property OnSubfocusChanging: TOnGraphSubfocusEvent;
   property OnSubfocusChanged: TOnGraphSubfocusEvent;
   property OnSelectionItemChanged: TOnGraphSelectionEvent;
   property OnSelectionChanged: TOnGraphSelectionEvent;
   property OnNodeExpanded: TOnTreeEvent;
   property OnNodeCollapsed: TOnTreeEvent;
   property EnableDropFiles: Boolean;
   property OnDropFiles: TDropFilesEvent;
   property OnHintShow: THintShowEvent;
   property OnOverrideScrollRange: TOnOverrideScrollRangeEvent;
   property OnAlignInsertBefore: TAlignInsertBeforeEvent;
   property OnAlignPosition: TAlignPositionEvent;
   property HorzScrollBar: TControlScrollBar;
   property VertScrollBar: TControlScrollBar;
   property AlignWithMargins: Boolean;
   property Left: Integer;
   property Top: Integer;
   property Width: Integer;
   property Height: Integer;
   property Cursor: TCursor;
   property Hint: string;
   property HelpType: THelpType;
   property HelpKeyword: string;
   property HelpContext: THelpContext;
   property Margins: TMargins;
   property CustomHint: TCustomHint;
   property ParentCustomHint: Boolean;
   property Name: TComponentName;
   property Tag: NativeInt;
  end;
