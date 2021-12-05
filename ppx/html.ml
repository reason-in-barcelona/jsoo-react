let ( & ) = List.append

type attributeType = String | Int | Float | Bool | Style | Ref | InnerHtml

type eventType =
  | Clipboard
  | Composition
  | Keyboard
  | Focus
  | Form
  | Mouse
  | Selection
  | Touch
  | UI
  | Wheel
  | Media
  | Image
  | Animation
  | Transition
  | Pointer
  | Drag

type attribute = {type_: attributeType; name: string; htmlName: string}

type event = {type_: eventType; name: string}

type prop = Attribute of attribute | Event of event

type element = {tag: string; attributes: prop list}

let attributeReferrerPolicy = String
(* | Empty
   | NoReferrer
   | NoReferrerWhenDowngrade
   | Origin
   | OriginWhenCrossOrigin
   | SameOrigin
   | StrictOrigin
   | StrictOriginWhenCrossOrigin
   | UnsafeUrl *)

let attributeAnchorTarget = String
(* | Self
   | Blank
   | Parent
   | Top
   | Custom of String *)

let domAttributes =
  [ (* Clipboard Events *)
    Event {name= "onCopy"; type_= Clipboard}
  ; Event {name= "onCopyCapture"; type_= Clipboard}
  ; Event {name= "onCut"; type_= Clipboard}
  ; Event {name= "onCutCapture"; type_= Clipboard}
  ; Event {name= "onPaste"; type_= Clipboard}
  ; Event {name= "onPasteCapture"; type_= Clipboard} (* Composition Events *)
  ; Event {name= "onCompositionEnd"; type_= Composition}
  ; Event {name= "onCompositionEndCapture"; type_= Composition}
  ; Event {name= "onCompositionStart"; type_= Composition}
  ; Event {name= "onCompositionStartCapture"; type_= Composition}
  ; Event {name= "onCompositionUpdate"; type_= Composition}
  ; Event {name= "onCompositionUpdateCapture"; type_= Composition}
    (* Focus Events *)
  ; Event {name= "onFocus"; type_= Focus}
  ; Event {name= "onFocusCapture"; type_= Focus}
  ; Event {name= "onBlur"; type_= Focus}
  ; Event {name= "onBlurCapture"; type_= Focus} (* Form Events *)
  ; Event {name= "onChange"; type_= Form}
  ; Event {name= "onChangeCapture"; type_= Form}
  ; Event {name= "onBeforeInput"; type_= Form}
  ; Event {name= "onBeforeInputCapture"; type_= Form}
  ; Event {name= "onInput"; type_= Form}
  ; Event {name= "onInputCapture"; type_= Form}
  ; Event {name= "onReset"; type_= Form}
  ; Event {name= "onResetCapture"; type_= Form}
  ; Event {name= "onSubmit"; type_= Form}
  ; Event {name= "onSubmitCapture"; type_= Form}
  ; Event {name= "onInvalid"; type_= Form}
  ; Event {name= "onInvalidCapture"; type_= Form} (* Image Events *)
  ; Event {name= "onLoad"; type_= Media}
  ; Event {name= "onLoadCapture"; type_= Media}
  ; Event {name= "onError"; type_= Media}
  ; Event {name= "onErrorCapture"; type_= Media} (* Keyboard Events *)
  ; Event {name= "onKeyDown"; type_= Keyboard}
  ; Event {name= "onKeyDownCapture"; type_= Keyboard}
  ; Event {name= "onKeyPress"; type_= Keyboard}
  ; Event {name= "onKeyPressCapture"; type_= Keyboard}
  ; Event {name= "onKeyUp"; type_= Keyboard}
  ; Event {name= "onKeyUpCapture"; type_= Keyboard} (* Media Events *)
  ; Event {name= "onAbort"; type_= Media}
  ; Event {name= "onAbortCapture"; type_= Media}
  ; Event {name= "onCanPlay"; type_= Media}
  ; Event {name= "onCanPlayCapture"; type_= Media}
  ; Event {name= "onCanPlayThrough"; type_= Media}
  ; Event {name= "onCanPlayThroughCapture"; type_= Media}
  ; Event {name= "onDurationChange"; type_= Media}
  ; Event {name= "onDurationChangeCapture"; type_= Media}
  ; Event {name= "onEmptied"; type_= Media}
  ; Event {name= "onEmptiedCapture"; type_= Media}
  ; Event {name= "onEncrypted"; type_= Media}
  ; Event {name= "onEncryptedCapture"; type_= Media}
  ; Event {name= "onEnded"; type_= Media}
  ; Event {name= "onEndedCapture"; type_= Media}
  ; Event {name= "onLoadedData"; type_= Media}
  ; Event {name= "onLoadedDataCapture"; type_= Media}
  ; Event {name= "onLoadedMetadata"; type_= Media}
  ; Event {name= "onLoadedMetadataCapture"; type_= Media}
  ; Event {name= "onLoadStart"; type_= Media}
  ; Event {name= "onLoadStartCapture"; type_= Media}
  ; Event {name= "onPause"; type_= Media}
  ; Event {name= "onPauseCapture"; type_= Media}
  ; Event {name= "onPlay"; type_= Media}
  ; Event {name= "onPlayCapture"; type_= Media}
  ; Event {name= "onPlaying"; type_= Media}
  ; Event {name= "onPlayingCapture"; type_= Media}
  ; Event {name= "onProgress"; type_= Media}
  ; Event {name= "onProgressCapture"; type_= Media}
  ; Event {name= "onRateChange"; type_= Media}
  ; Event {name= "onRateChangeCapture"; type_= Media}
  ; Event {name= "onSeeked"; type_= Media}
  ; Event {name= "onSeekedCapture"; type_= Media}
  ; Event {name= "onSeeking"; type_= Media}
  ; Event {name= "onSeekingCapture"; type_= Media}
  ; Event {name= "onStalled"; type_= Media}
  ; Event {name= "onStalledCapture"; type_= Media}
  ; Event {name= "onSuspend"; type_= Media}
  ; Event {name= "onSuspendCapture"; type_= Media}
  ; Event {name= "onTimeUpdate"; type_= Media}
  ; Event {name= "onTimeUpdateCapture"; type_= Media}
  ; Event {name= "onVolumeChange"; type_= Media}
  ; Event {name= "onVolumeChangeCapture"; type_= Media}
  ; Event {name= "onWaiting"; type_= Media}
  ; Event {name= "onWaitingCapture"; type_= Media} (* MouseEvents *)
  ; Event {name= "onAuxClick"; type_= Mouse}
  ; Event {name= "onAuxClickCapture"; type_= Mouse}
  ; Event {name= "onClick"; type_= Mouse}
  ; Event {name= "onClickCapture"; type_= Mouse}
  ; Event {name= "onContextMenu"; type_= Mouse}
  ; Event {name= "onContextMenuCapture"; type_= Mouse}
  ; Event {name= "onDoubleClick"; type_= Mouse}
  ; Event {name= "onDoubleClickCapture"; type_= Mouse}
  ; Event {name= "onDrag"; type_= Drag}
  ; Event {name= "onDragCapture"; type_= Drag}
  ; Event {name= "onDragEnd"; type_= Drag}
  ; Event {name= "onDragEndCapture"; type_= Drag}
  ; Event {name= "onDragEnter"; type_= Drag}
  ; Event {name= "onDragEnterCapture"; type_= Drag}
  ; Event {name= "onDragExit"; type_= Drag}
  ; Event {name= "onDragExitCapture"; type_= Drag}
  ; Event {name= "onDragLeave"; type_= Drag}
  ; Event {name= "onDragLeaveCapture"; type_= Drag}
  ; Event {name= "onDragOver"; type_= Drag}
  ; Event {name= "onDragOverCapture"; type_= Drag}
  ; Event {name= "onDragStart"; type_= Drag}
  ; Event {name= "onDragStartCapture"; type_= Drag}
  ; Event {name= "onDrop"; type_= Drag}
  ; Event {name= "onDropCapture"; type_= Drag}
  ; Event {name= "onMouseDown"; type_= Mouse}
  ; Event {name= "onMouseDownCapture"; type_= Mouse}
  ; Event {name= "onMouseEnter"; type_= Mouse}
  ; Event {name= "onMouseLeave"; type_= Mouse}
  ; Event {name= "onMouseMove"; type_= Mouse}
  ; Event {name= "onMouseMoveCapture"; type_= Mouse}
  ; Event {name= "onMouseOut"; type_= Mouse}
  ; Event {name= "onMouseOutCapture"; type_= Mouse}
  ; Event {name= "onMouseOver"; type_= Mouse}
  ; Event {name= "onMouseOverCapture"; type_= Mouse}
  ; Event {name= "onMouseUp"; type_= Mouse}
  ; Event {name= "onMouseUpCapture"; type_= Mouse} (* Selection Events *)
  ; Event {name= "onSelect"; type_= Selection}
  ; Event {name= "onSelectCapture"; type_= Selection} (* Touch Events *)
  ; Event {name= "onTouchCancel"; type_= Touch}
  ; Event {name= "onTouchCancelCapture"; type_= Touch}
  ; Event {name= "onTouchEnd"; type_= Touch}
  ; Event {name= "onTouchEndCapture"; type_= Touch}
  ; Event {name= "onTouchMove"; type_= Touch}
  ; Event {name= "onTouchMoveCapture"; type_= Touch}
  ; Event {name= "onTouchStart"; type_= Touch}
  ; Event {name= "onTouchStartCapture"; type_= Touch} (* Pointer Events *)
  ; Event {name= "onPointerDown"; type_= Pointer}
  ; Event {name= "onPointerDownCapture"; type_= Pointer}
  ; Event {name= "onPointerMove"; type_= Pointer}
  ; Event {name= "onPointerMoveCapture"; type_= Pointer}
  ; Event {name= "onPointerUp"; type_= Pointer}
  ; Event {name= "onPointerUpCapture"; type_= Pointer}
  ; Event {name= "onPointerCancel"; type_= Pointer}
  ; Event {name= "onPointerCancelCapture"; type_= Pointer}
  ; Event {name= "onPointerEnter"; type_= Pointer}
  ; Event {name= "onPointerEnterCapture"; type_= Pointer}
  ; Event {name= "onPointerLeave"; type_= Pointer}
  ; Event {name= "onPointerLeaveCapture"; type_= Pointer}
  ; Event {name= "onPointerOver"; type_= Pointer}
  ; Event {name= "onPointerOverCapture"; type_= Pointer}
  ; Event {name= "onPointerOut"; type_= Pointer}
  ; Event {name= "onPointerOutCapture"; type_= Pointer}
  ; Event {name= "onGotPointerCapture"; type_= Pointer}
  ; Event {name= "onGotPointerCaptureCapture"; type_= Pointer}
  ; Event {name= "onLostPointerCapture"; type_= Pointer}
  ; Event {name= "onLostPointerCaptureCapture"; type_= Pointer} (* UI Events *)
  ; Event {name= "onScroll"; type_= UI}
  ; Event {name= "onScrollCapture"; type_= UI} (* Wheel Events *)
  ; Event {name= "onWheel"; type_= Wheel}
  ; Event {name= "onWheelCapture"; type_= Wheel} (* Animation Events *)
  ; Event {name= "onAnimationStart"; type_= Animation}
  ; Event {name= "onAnimationStartCapture"; type_= Animation}
  ; Event {name= "onAnimationEnd"; type_= Animation}
  ; Event {name= "onAnimationEndCapture"; type_= Animation}
  ; Event {name= "onAnimationIteration"; type_= Animation}
  ; Event {name= "onAnimationIterationCapture"; type_= Animation}
    (* Transition Events *)
  ; Event {name= "onTransitionEnd"; type_= Transition}
  ; Event {name= "onTransitionEndCapture"; type_= Transition} ]

(* All the WAI-ARIA 1.1 attributes from https://www.w3.org/TR/wai-aria-1.1/ *)
let ariaAttributes =
  [ (* Identifies the currently active element when DOM focus is on a composite widget, textbox, group, or application. *)
    Attribute
      { name= "ariaActivedescendant"
      ; htmlName= "aria-activedescendant"
      ; type_= String }
    (* Indicates whether assistive technologies will present all, or only parts of, the changed region based on the change notifications defined by the aria-relevant attribute. *)
  ; Attribute
      { name= "ariaAtomic"
      ; htmlName= "aria-atomic"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Indicates whether inputting text could trigger display of one or more predictions of the user's intended value for an input and specifies how predictions would be
     * presented if they are made.
     *)
  ; Attribute
      { name= "ariaAutocomplete"
      ; htmlName= "aria-autocomplete"
      ; type_= String (* 'none' | 'inline' | 'list' | 'both' *) }
    (* Indicates an element is being modified and that assistive technologies MAY want to wait until the modifications are complete before exposing them to the user. *)
  ; Attribute
      { name= "ariaBusy"
      ; htmlName= "aria-busy"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Indicates the current "checked" state of checkboxes, radio buttons, and other widgets.
     * @see aria-pressed @see aria-selected.
     *)
  ; Attribute
      { name= "ariaChecked"
      ; htmlName= "aria-checked"
      ; type_= String (* Bool | 'false' | 'mixed' | 'true' *) }
    (*
     * Defines the total number of columns in a table, grid, or treegrid.
     * @see aria-colindex.
     *)
  ; Attribute {name= "ariaColcount"; htmlName= "aria-colcount"; type_= Int}
    (*
     * Defines an element's column index or position with respect to the total number of columns within a table, grid, or treegrid.
     * @see aria-colcount @see aria-colspan.
     *)
  ; Attribute {name= "ariaColindex"; htmlName= "aria-colindex"; type_= Int}
    (*
     * Defines the number of columns spanned by a cell or gridcell within a table, grid, or treegrid.
     * @see aria-colindex @see aria-rowspan.
     *)
  ; Attribute {name= "ariaColspan"; htmlName= "aria-colspan"; type_= Int}
    (*
     * Identifies the element (or elements) whose contents or presence are controlled by the current element.
     * @see aria-owns.
     *)
  ; Attribute {name= "ariaControls"; htmlName= "aria-controls"; type_= String}
    (* Indicates the element that represents the current item within a container or set of related elements. *)
  ; Attribute
      { name= "ariaCurrent"
      ; htmlName= "aria-current"
      ; type_=
          String
          (* Bool | 'false' | 'true' |  'page' | 'step' | 'location' | 'date' | 'time' *)
      }
    (*
     * Identifies the element (or elements) that describes the object.
     * @see aria-labelledby
     *)
  ; Attribute
      {name= "ariaDescribedby"; htmlName= "aria-describedby"; type_= String}
    (*
     * Identifies the element that provides a detailed, extended description for the object.
     * @see aria-describedby.
     *)
  ; Attribute {name= "ariaDetails"; htmlName= "aria-details"; type_= String}
    (*
     * Indicates that the element is perceivable but disabled, so it is not editable or otherwise operable.
     * @see aria-hidden @see aria-readonly.
     *)
  ; Attribute
      { name= "ariaDisabled"
      ; htmlName= "aria-disabled"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Indicates what functions can be performed when a dragged object is released on the drop target.
     * @deprecated in ARIA 1.1
     *)
  ; Attribute
      { name= "ariaDropeffect"
      ; htmlName= "aria-dropeffect"
      ; type_=
          String (* 'none' | 'copy' | 'execute' | 'link' | 'move' | 'popup' *)
      }
    (*
     * Identifies the element that provides an error message for the object.
     * @see aria-invalid @see aria-describedby.
     *)
  ; Attribute
      {name= "ariaErrormessage"; htmlName= "aria-errormessage"; type_= String}
    (* Indicates whether the element, or another grouping element it controls, is currently expanded or collapsed. *)
  ; Attribute
      { name= "ariaExpanded"
      ; htmlName= "aria-expanded"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Identifies the next element (or elements) in an alternate reading order of content which, at the user's discretion,
     * allows assistive technology to override the general default of reading in document source order.
     *)
  ; Attribute {name= "ariaFlowto"; htmlName= "aria-flowto"; type_= String}
    (*
     * Indicates an element's "grabbed" state in a drag-and-drop operation.
     * @deprecated in ARIA 1.1
     *)
  ; Attribute
      { name= "ariaGrabbed"
      ; htmlName= "aria-grabbed"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (* Indicates the availability and type of interactive popup element, such as menu or dialog, that can be triggered by an element. *)
  ; Attribute
      { name= "ariaHaspopup"
      ; htmlName= "aria-haspopup"
      ; type_=
          String
          (* Bool | 'false' | 'true' | 'menu' | 'listbox' | 'tree' | 'grid' | 'dialog'; *)
      }
    (*
     * Indicates whether the element is exposed to an accessibility API.
     * @see aria-disabled.
     *)
  ; Attribute
      { name= "ariaHidden"
      ; htmlName= "aria-hidden"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Indicates the entered value does not conform to the format expected by the application.
     * @see aria-errormessage.
     *)
  ; Attribute
      { name= "ariaInvalid"
      ; htmlName= "aria-invalid"
      ; type_= String (* Bool | 'false' | 'true' |  'grammar' | 'spelling'; *)
      }
    (* Indicates keyboard shortcuts that an author has implemented to activate or give focus to an element. *)
  ; Attribute
      {name= "ariaKeyshortcuts"; htmlName= "aria-keyshortcuts"; type_= String}
    (*
     * Defines a String value that labels the current element.
     * @see aria-labelledby.
     *)
  ; Attribute {name= "ariaLabel"; htmlName= "aria-label"; type_= String}
    (*
     * Identifies the element (or elements) that labels the current element.
     * @see aria-describedby.
     *)
  ; Attribute
      {name= "ariaLabelledby"; htmlName= "aria-labelledby"; type_= String}
    (* Defines the hierarchical level of an element within a structure. *)
  ; Attribute {name= "ariaLevel"; htmlName= "aria-level"; type_= Int}
    (* Indicates that an element will be updated, and describes the types of updates the user agents, assistive technologies, and user can expect ;rom the live region. *)
  ; Attribute
      { name= "ariaLive"
      ; htmlName= "aria-live"
      ; type_= String (* 'off' | 'assertive' | 'polite' *) }
    (* Indicates whether an element is modal when displayed. *)
  ; Attribute
      { name= "ariaModal"
      ; htmlName= "aria-modal"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (* Indicates whether a text box accepts multiple lines of input or only a single line. *)
  ; Attribute
      { name= "ariaMultiline"
      ; htmlName= "aria-multiline"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (* Indicates that the user may select more than one item from the current selectable descendants. *)
  ; Attribute
      { name= "ariaMultiselectable"
      ; htmlName= "aria-multiselectable"
      ; type_= String (* Bool |  'false' | 'true' *) }
    (* Indicates whether the element's orientation is horizontal, vertical, or unknown/ambiguous. *)
  ; Attribute
      { name= "ariaOrientation"
      ; htmlName= "aria-orientation"
      ; type_= String (* 'horizontal' | 'vertical' *) }
    (*
     * Identifies an element (or elements) in order to define a visual, functional, or contextual parent/child relationship
     * between DOM elements where the DOM hierarchy cannot be used to represent the relationship.
     * @see aria-controls.
     *)
  ; Attribute {name= "ariaOwns"; htmlName= "aria-owns"; type_= String}
    (*
     * Defines a short hint (a word or short phrase) intended to aid the user with data entry when the control has no value.
     * A hint could be a sample value or a brief description of the expected format.
     *)
  ; Attribute
      {name= "ariaPlaceholder"; htmlName= "aria-placeholder"; type_= String}
    (*
     * Defines an element's number or position in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM.
     * @see aria-setsize.
     *)
  ; Attribute {name= "ariaPosinset"; htmlName= "aria-posinset"; type_= Int}
    (*
     * Indicates the current "pressed" state of toggle buttons.
     * @see aria-checked @see aria-selected.
     *)
  ; Attribute
      { name= "ariaPressed"
      ; htmlName= "aria-pressed"
      ; type_= String (* Bool | 'false' | 'mixed' | 'true' *) }
    (*
     * Indicates that the element is not editable, but is otherwise operable.
     * @see aria-disabled.
     *)
  ; Attribute
      { name= "ariaReadonly"
      ; htmlName= "aria-readonly"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Indicates what notifications the user agent will trigger when the accessibility tree within a live region is modified.
     * @see aria-atomic.
     *)
  ; Attribute
      { name= "ariaRelevant"
      ; htmlName= "aria-relevant"
      ; type_=
          String
          (* 'additions' | 'additions removals' | 'additions text' | 'all' | 'removals' | 'removals additions' | 'removals text' | 'text' | 'text additions' | 'text removals' *)
      }
    (* Indicates that user input is required on the element before a form may be submitted. *)
  ; Attribute
      { name= "ariaRequired"
      ; htmlName= "aria-required"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (* Defines a human-readable, author-localized description for the role of an element. *)
  ; Attribute
      { name= "ariaRoledescription"
      ; htmlName= "aria-roledescription"
      ; type_= String }
    (*
     * Defines the total number of rows in a table, grid, or treegrid.
     * @see aria-rowindex.
     *)
  ; Attribute {name= "ariaRowcount"; htmlName= "aria-rowcount"; type_= Int}
    (*
     * Defines an element's row index or position with respect to the total number of rows within a table, grid, or treegrid.
     * @see aria-rowcount @see aria-rowspan.
     *)
  ; Attribute {name= "ariaRowindex"; htmlName= "aria-rowindex"; type_= Int}
    (*
     * Defines the number of rows spanned by a cell or gridcell within a table, grid, or treegrid.
     * @see aria-rowindex @see aria-colspan.
     *)
  ; Attribute {name= "ariaRowspan"; htmlName= "aria-rowspan"; type_= Int}
    (*
     * Indicates the current "selected" state of various widgets.
     * @see aria-checked @see aria-pressed.
     *)
  ; Attribute
      { name= "ariaSelected"
      ; htmlName= "aria-selected"
      ; type_= String (* Bool | 'false' | 'true' *) }
    (*
     * Defines the number of items in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM.
     * @see aria-posinset.
     *)
  ; Attribute {name= "ariaSetsize"; htmlName= "aria-setsize"; type_= Int}
    (* Indicates if items in a table or grid are sorted in ascending or descending order. *)
  ; Attribute
      { name= "ariaSort"
      ; htmlName= "aria-sort"
      ; type_= String (* 'none' | 'ascending' | 'descending' | 'other' *) }
    (* Defines the maximum allowed value for a range widget. *)
  ; Attribute {name= "ariaValuemax"; htmlName= "aria-valuemax"; type_= Int}
    (* Defines the minimum allowed value for a range widget. *)
  ; Attribute {name= "ariaValuemin"; htmlName= "aria-valuemin"; type_= Int}
    (*
     * Defines the current value for a range widget.
     * @see aria-valuetext.
     *)
  ; Attribute {name= "ariaValuenow"; htmlName= "aria-valuenow"; type_= Int}
    (* Defines the human readable text alternative of aria-valuenow for a range widget. *)
  ; Attribute {name= "ariaValuetext"; htmlName= "aria-valuetext"; type_= String}
  ]

(* All the WAI-ARIA 1.1 role attribute values from https://www.w3.org/TR/wai-aria-1.1/#role_definitions *)
let ariaRole = String
(* | Alert
   | Alertdialog
   | Application
   | Article
   | Banner
   | Button
   | Cell
   | Checkbox
   | Columnheader
   | Combobox
   | Complementary
   | Contentinfo
   | Definition
   | Dialog
   | Directory
   | Document
   | Feed
   | Figure
   | Form
   | Grid
   | Gridcell
   | Group
   | Heading
   | Img
   | Link
   | List
   | Listbox
   | Listitem
   | Log
   | Main
   | Marquee
   | Math
   | Menu
   | Menubar
   | Menuitem
   | Menuitemcheckbox
   | Menuitemradio
   | Navigation
   | None
   | Note
   | Option
   | Presentation
   | Progressbar
   | Radio
   | Radiogroup
   | Region
   | Row
   | Rowgroup
   | Rowheader
   | Scrollbar
   | Search
   | Searchbox
   | Separator
   | Slider
   | Spinbutton
   | Status
   | Switch
   | Tab
   | Table
   | Tablist
   | Tabpanel
   | Term
   | Textbox
   | Timer
   | Toolbar
   | Tooltip
   | Tree
   | Treegrid
   | Treeitem
   | Custom of String *)

(* AriaAttributes, DOMAttributes*)
let attributesHTML =
  [ (* React-specific Attributes *)
    Attribute
      { name= "dangerouslySetInnerHTML"
      ; htmlName= "dangerouslySetInnerHTML"
      ; type_= InnerHtml }
  ; Attribute {name= "defaultChecked"; htmlName= "defaultChecked"; type_= Bool}
  ; Attribute
      { name= "defaultValue"
      ; htmlName= "defaultValue"
      ; type_= String (* | number | ReadonlyArray<String> *) }
  ; Attribute
      { name= "suppressContentEditableWarning"
      ; htmlName= "suppressContentEditableWarning"
      ; type_= Bool }
  ; Attribute
      { name= "suppressHydrationWarning"
      ; htmlName= "suppressHydrationWarning"
      ; type_= Bool }
    (* Standard HTML Attributes *)
  ; Attribute {name= "accessKey"; htmlName= "accesskey"; type_= String}
  ; Attribute {name= "className"; htmlName= "classname"; type_= String}
  ; Attribute {name= "contextMenu"; htmlName= "contextmenu"; type_= String}
  ; Attribute {name= "dir"; htmlName= "dir"; type_= String}
  ; Attribute
      {name= "draggable"; htmlName= "draggable"; type_= String (* Booleanish *)}
  ; Attribute {name= "hidden"; htmlName= "hidden"; type_= Bool}
  ; Attribute {name= "id"; htmlName= "id"; type_= String}
  ; Attribute {name= "lang"; htmlName= "lang"; type_= String}
  ; Attribute {name= "placeholder"; htmlName= "placeholder"; type_= String}
  ; Attribute {name= "slot"; htmlName= "slot"; type_= String}
  ; Attribute
      { name= "spellCheck"
      ; htmlName= "spellcheck"
      ; type_= String (* Booleanish *) }
  ; Attribute {name= "style"; htmlName= "style"; type_= Style}
  ; Attribute {name= "tabIndex"; htmlName= "tabindex"; type_= Int}
  ; Attribute {name= "title"; htmlName= "title"; type_= String}
  ; Attribute
      { name= "translate"
      ; htmlName= "translate"
      ; type_= String (* 'yes' | 'no' *) }
  ; Attribute {name= "radioGroup"; htmlName= "radiogroup"; type_= String}
    (* Unknown *)
    (* <command>, <menuitem> *)
    (* WAI-ARIA *)
  ; Attribute {name= "role"; htmlName= "role"; type_= ariaRole}
    (* RDFa Attributes *)
  ; Attribute {name= "about"; htmlName= "about"; type_= String}
  ; Attribute {name= "datatype"; htmlName= "datatype"; type_= String}
  ; Attribute {name= "inlist"; htmlName= "inlist"; type_= String (* any *)}
  ; Attribute {name= "prefix"; htmlName= "prefix"; type_= String}
  ; Attribute {name= "property"; htmlName= "property"; type_= String}
  ; Attribute {name= "resource"; htmlName= "resource"; type_= String}
  ; Attribute {name= "typeof"; htmlName= "typeof"; type_= String}
  ; Attribute {name= "vocab"; htmlName= "vocab"; type_= String}
    (* Non-standard Attributes *)
  ; Attribute {name= "autoCapitalize"; htmlName= "autocapitalize"; type_= String}
  ; Attribute {name= "autoCorrect"; htmlName= "autocorrect"; type_= String}
  ; Attribute {name= "autoSave"; htmlName= "autosave"; type_= String}
  ; Attribute {name= "color"; htmlName= "color"; type_= String}
  ; Attribute {name= "itemProp"; htmlName= "itemprop"; type_= String}
  ; Attribute {name= "itemScope"; htmlName= "itemscope"; type_= Bool}
  ; Attribute {name= "itemType"; htmlName= "itemtype"; type_= String}
  ; Attribute {name= "itemID"; htmlName= "itemid"; type_= String}
  ; Attribute {name= "itemRef"; htmlName= "itemref"; type_= String}
  ; Attribute {name= "results"; htmlName= "results"; type_= Int}
  ; Attribute {name= "security"; htmlName= "security"; type_= String}
    (* Living Standard
     * Hints at the type of data that might be entered by the user while editing the element or its contents
     * @see https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-inputmode-attribute *)
  ; Attribute
      { name= "inputMode"
      ; htmlName= "inputmode"
      ; type_=
          String
          (* 'none' | 'text' | 'tel' | 'url' | 'email' | 'numeric' | 'decimal' | 'search' *)
      }
    (* Specify that a standard HTML element should behave like a defined custom built-in element
        * @see https://html.spec.whatwg.org/multipage/custom-elements.html#attr-is *)
  ; Attribute {name= "is"; htmlName= "is"; type_= String} ]

let allHTMLAttributes =
  [ (* Standard HTML Attributes *)
    Attribute {name= "accept"; htmlName= "accept"; type_= String}
  ; Attribute {name= "acceptCharset"; htmlName= "acceptcharset"; type_= String}
  ; Attribute {name= "action"; htmlName= "action"; type_= String}
  ; Attribute {name= "allowFullScreen"; htmlName= "allowfullscreen"; type_= Bool}
  ; Attribute
      {name= "allowTransparency"; htmlName= "allowtransparency"; type_= Bool}
  ; Attribute {name= "alt"; htmlName= "alt"; type_= String}
  ; Attribute {name= "as"; htmlName= "as"; type_= String}
  ; Attribute {name= "async"; htmlName= "async"; type_= Bool}
  ; Attribute {name= "autoComplete"; htmlName= "autocomplete"; type_= String}
  ; Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "autoPlay"; htmlName= "autoplay"; type_= Bool}
  ; Attribute {name= "capture"; htmlName= "capture"; type_= (* Bool |  *) String}
  ; Attribute
      { name= "cellPadding"
      ; htmlName= "cellpadding"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "cellSpacing"
      ; htmlName= "cellspacing"
      ; type_= String (* number |  *) }
  ; Attribute {name= "charSet"; htmlName= "charset"; type_= String}
  ; Attribute {name= "challenge"; htmlName= "challenge"; type_= String}
  ; Attribute {name= "checked"; htmlName= "checked"; type_= Bool}
  ; Attribute {name= "cite"; htmlName= "cite"; type_= String}
  ; Attribute {name= "classID"; htmlName= "classid"; type_= String}
  ; Attribute {name= "cols"; htmlName= "cols"; type_= Int (* number *)}
  ; Attribute {name= "colSpan"; htmlName= "colspan"; type_= Int (* number *)}
  ; Attribute {name= "content"; htmlName= "content"; type_= String}
  ; Attribute {name= "controls"; htmlName= "controls"; type_= Bool}
  ; Attribute {name= "coords"; htmlName= "coords"; type_= String}
  ; Attribute {name= "crossOrigin"; htmlName= "crossorigin"; type_= String}
  ; Attribute {name= "data"; htmlName= "data"; type_= String}
  ; Attribute {name= "dateTime"; htmlName= "datetime"; type_= String}
  ; Attribute {name= "default"; htmlName= "default"; type_= Bool}
  ; Attribute {name= "defer"; htmlName= "defer"; type_= Bool}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "download"; htmlName= "download"; type_= String (* any *)}
  ; Attribute {name= "encType"; htmlName= "enctype"; type_= String}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "formAction"; htmlName= "formaction"; type_= String}
  ; Attribute {name= "formEncType"; htmlName= "formenctype"; type_= String}
  ; Attribute {name= "formMethod"; htmlName= "formmethod"; type_= String}
  ; Attribute {name= "formNoValidate"; htmlName= "formnovalidate"; type_= Bool}
  ; Attribute {name= "formTarget"; htmlName= "formtarget"; type_= String}
  ; Attribute
      { name= "frameBorder"
      ; htmlName= "frameborder"
      ; type_= String (* number |  *) }
  ; Attribute {name= "headers"; htmlName= "headers"; type_= String}
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "high"; htmlName= "high"; type_= Int (* number *)}
  ; Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute {name= "hrefLang"; htmlName= "hreflang"; type_= String}
  ; Attribute {name= "htmlFor"; htmlName= "htmlfor"; type_= String}
  ; Attribute {name= "httpEquiv"; htmlName= "httpequiv"; type_= String}
  ; Attribute {name= "integrity"; htmlName= "integrity"; type_= String}
  ; Attribute {name= "keyParams"; htmlName= "keyparams"; type_= String}
  ; Attribute {name= "keyType"; htmlName= "keytype"; type_= String}
  ; Attribute {name= "kind"; htmlName= "kind"; type_= String}
  ; Attribute {name= "label"; htmlName= "label"; type_= String}
  ; Attribute {name= "list"; htmlName= "list"; type_= String}
  ; Attribute {name= "loop"; htmlName= "loop"; type_= Bool}
  ; Attribute {name= "low"; htmlName= "low"; type_= Int (* number *)}
  ; Attribute {name= "manifest"; htmlName= "manifest"; type_= String}
  ; Attribute
      {name= "marginHeight"; htmlName= "marginheight"; type_= Int (* number *)}
  ; Attribute
      {name= "marginWidth"; htmlName= "marginwidth"; type_= Int (* number *)}
  ; Attribute {name= "max"; htmlName= "max"; type_= String (* number |  *)}
  ; Attribute {name= "maxLength"; htmlName= "maxlength"; type_= Int (* number *)}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "mediaGroup"; htmlName= "mediagroup"; type_= String}
  ; Attribute {name= "method"; htmlName= "method"; type_= String}
  ; Attribute {name= "min"; htmlName= "min"; type_= String (* number |  *)}
  ; Attribute {name= "minLength"; htmlName= "minlength"; type_= Int (* number *)}
  ; Attribute {name= "multiple"; htmlName= "multiple"; type_= Bool}
  ; Attribute {name= "muted"; htmlName= "muted"; type_= Bool}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "nonce"; htmlName= "nonce"; type_= String}
  ; Attribute {name= "noValidate"; htmlName= "novalidate"; type_= Bool}
  ; Attribute {name= "open"; htmlName= "open"; type_= Bool}
  ; Attribute {name= "optimum"; htmlName= "optimum"; type_= Int (* number *)}
  ; Attribute {name= "pattern"; htmlName= "pattern"; type_= String}
  ; Attribute {name= "placeholder"; htmlName= "placeholder"; type_= String}
  ; Attribute {name= "playsInline"; htmlName= "playsinline"; type_= Bool}
  ; Attribute {name= "poster"; htmlName= "poster"; type_= String}
  ; Attribute {name= "preload"; htmlName= "preload"; type_= String}
  ; Attribute {name= "readOnly"; htmlName= "readonly"; type_= Bool}
  ; Attribute {name= "rel"; htmlName= "rel"; type_= String}
  ; Attribute {name= "required"; htmlName= "required"; type_= Bool}
  ; Attribute {name= "reversed"; htmlName= "reversed"; type_= Bool}
  ; Attribute {name= "rows"; htmlName= "rows"; type_= Int (* number *)}
  ; Attribute {name= "rowSpan"; htmlName= "rowspan"; type_= Int (* number *)}
  ; Attribute {name= "sandbox"; htmlName= "sandbox"; type_= String}
  ; Attribute {name= "scope"; htmlName= "scope"; type_= String}
  ; Attribute {name= "scoped"; htmlName= "scoped"; type_= Bool}
  ; Attribute {name= "scrolling"; htmlName= "scrolling"; type_= String}
  ; Attribute {name= "seamless"; htmlName= "seamless"; type_= Bool}
  ; Attribute {name= "selected"; htmlName= "selected"; type_= Bool}
  ; Attribute {name= "shape"; htmlName= "shape"; type_= String}
  ; Attribute {name= "size"; htmlName= "size"; type_= Int (* number *)}
  ; Attribute {name= "sizes"; htmlName= "sizes"; type_= String}
  ; Attribute {name= "span"; htmlName= "span"; type_= Int (* number *)}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "srcDoc"; htmlName= "srcdoc"; type_= String}
  ; Attribute {name= "srcLang"; htmlName= "srclang"; type_= String}
  ; Attribute {name= "srcSet"; htmlName= "srcset"; type_= String}
  ; Attribute {name= "start"; htmlName= "start"; type_= Int (* number *)}
  ; Attribute {name= "step"; htmlName= "step"; type_= (* number | *) String}
  ; Attribute {name= "summary"; htmlName= "summary"; type_= String}
  ; Attribute {name= "target"; htmlName= "target"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute {name= "useMap"; htmlName= "usemap"; type_= String}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) }
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ; Attribute {name= "wmode"; htmlName= "wmode"; type_= String}
  ; Attribute {name= "wrap"; htmlName= "wrap"; type_= String} ]

let anchorHTMLAttributes =
  [ Attribute {name= "download"; htmlName= "download"; type_= String (* any; *)}
  ; Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute {name= "hrefLang"; htmlName= "hreflang"; type_= String}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "ping"; htmlName= "ping"; type_= String}
  ; Attribute {name= "rel"; htmlName= "rel"; type_= String}
  ; Attribute {name= "target"; htmlName= "target"; type_= attributeAnchorTarget}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute
      { name= "referrerPolicy"
      ; htmlName= "referrerpolicy"
      ; type_= attributeReferrerPolicy } ]

let audioHTMLAttributes = []

let areaHTMLAttributes =
  [ Attribute {name= "alt"; htmlName= "alt"; type_= String}
  ; Attribute {name= "coords"; htmlName= "coords"; type_= String}
  ; Attribute {name= "download"; htmlName= "download"; type_= String (* any *)}
  ; Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute {name= "hrefLang"; htmlName= "hreflang"; type_= String}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute
      { name= "referrerPolicy"
      ; htmlName= "referrerpolicy"
      ; type_= attributeReferrerPolicy }
  ; Attribute {name= "rel"; htmlName= "rel"; type_= String}
  ; Attribute {name= "shape"; htmlName= "shape"; type_= String}
  ; Attribute {name= "target"; htmlName= "target"; type_= String} ]

let baseHTMLAttributes =
  [ Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute {name= "target"; htmlName= "target"; type_= String} ]

let blockquoteHTMLAttributes =
  [Attribute {name= "cite"; htmlName= "cite"; type_= String}]

let buttonHTMLAttributes =
  [ Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "formAction"; htmlName= "formaction"; type_= String}
  ; Attribute {name= "formEncType"; htmlName= "formenctype"; type_= String}
  ; Attribute {name= "formMethod"; htmlName= "formmethod"; type_= String}
  ; Attribute {name= "formNoValidate"; htmlName= "formnovalidate"; type_= Bool}
  ; Attribute {name= "formTarget"; htmlName= "formtarget"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute
      { name= "type_"
      ; htmlName= "type"
      ; type_= String (* 'submit' | 'reset' | 'button' *) }
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let canvasHTMLAttributes =
  [ Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let colHTMLAttributes =
  [ Attribute {name= "span"; htmlName= "span"; type_= Int (* number *)}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let colgroupHTMLAttributes =
  [Attribute {name= "span"; htmlName= "span"; type_= Int (* number *)}]

let dataHTMLAttributes =
  [ Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let detailsHTMLAttributes =
  [ Attribute {name= "open"; htmlName= "open"; type_= Bool}
  ; Event {name= "onToggle"; type_= Media} ]

let delHTMLAttributes =
  [ Attribute {name= "cite"; type_= String; htmlName= "cite"}
  ; Attribute {name= "dateTime"; type_= String; htmlName= "datetime"} ]

let dialogHTMLAttributes =
  [Attribute {name= "open"; htmlName= "open"; type_= Bool}]

let embedHTMLAttributes =
  [ Attribute {name= "height"; type_= String (* number |  *); htmlName= "height"}
  ; Attribute {name= "src"; type_= String; htmlName= "src"}
  ; Attribute {name= "type"; type_= String; htmlName= "type"}
  ; Attribute {name= "width"; type_= String (* number |  *); htmlName= "width"}
  ]

let fieldsetHTMLAttributes =
  [ Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String} ]

let formHTMLAttributes =
  [ Attribute {name= "acceptCharset"; htmlName= "acceptcharset"; type_= String}
  ; Attribute {name= "action"; htmlName= "action"; type_= String}
  ; Attribute {name= "autoComplete"; htmlName= "autocomplete"; type_= String}
  ; Attribute {name= "encType"; htmlName= "enctype"; type_= String}
  ; Attribute {name= "method"; htmlName= "method"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "noValidate"; htmlName= "novalidate"; type_= Bool}
  ; Attribute {name= "target"; htmlName= "target"; type_= String} ]

let htmlHTMLAttributes =
  [Attribute {name= "manifest"; htmlName= "manifest"; type_= String}]

let iframeHTMLAttributes =
  [ Attribute {name= "allow"; htmlName= "allow"; type_= String}
  ; Attribute {name= "allowFullScreen"; htmlName= "allowfullscreen"; type_= Bool}
  ; Attribute
      {name= "allowTransparency"; htmlName= "allowtransparency"; type_= Bool}
    (* @deprecated *)
  ; Attribute
      { name= "frameBorder"
      ; htmlName= "frameborder"
      ; type_= String (* number |  *) }
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
    (* @deprecated *)
  ; Attribute
      {name= "marginHeight"; htmlName= "marginheight"; type_= Int (* number *)}
    (* @deprecated *)
  ; Attribute
      {name= "marginWidth"; htmlName= "marginwidth"; type_= Int (* number *)}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "sandbox"; htmlName= "sandbox"; type_= String}
    (* @deprecated *)
  ; Attribute {name= "scrolling"; htmlName= "scrolling"; type_= String}
  ; Attribute {name= "seamless"; htmlName= "seamless"; type_= Bool}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "srcDoc"; htmlName= "srcdoc"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let imgHTMLAttributes =
  [ Attribute {name= "alt"; htmlName= "alt"; type_= String}
  ; Attribute
      { name= "crossOrigin"
      ; htmlName= "crossorigin"
      ; type_= String (* "anonymous" | "use-credentials" | "" *) }
  ; Attribute
      { name= "decoding"
      ; htmlName= "decoding"
      ; type_= String (* "async" | "auto" | "sync" *) }
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "sizes"; htmlName= "sizes"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "srcSet"; htmlName= "srcset"; type_= String}
  ; Attribute {name= "useMap"; htmlName= "usemap"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let insHTMLAttributes =
  [ Attribute {name= "cite"; htmlName= "cite"; type_= String}
  ; Attribute {name= "dateTime"; htmlName= "datetime"; type_= String} ]

let inputTypeAttribute = String
(*
        | 'button'
        | 'checkbox'
        | 'color'
        | 'date'
        | 'datetime-local'
        | 'email'
        | 'file'
        | 'hidden'
        | 'image'
        | 'month'
        | 'number'
        | 'password'
        | 'radio'
        | 'range'
        | 'reset'
        | 'search'
        | 'submit'
        | 'tel'
        | 'text'
        | 'time'
        | 'url'
        | 'week'
        | (String & {});  *)

let inputHTMLAttributes =
  [ Attribute {name= "accept"; htmlName= "accept"; type_= String}
  ; Attribute {name= "alt"; htmlName= "alt"; type_= String}
  ; Attribute {name= "autoComplete"; htmlName= "autocomplete"; type_= String}
  ; Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute
      { name= "capture"
      ; htmlName= "capture"
      ; type_=
          String
          (* Bool | *)
          (* https://www.w3.org/TR/html-media-capture/ *) }
  ; Attribute {name= "checked"; htmlName= "checked"; type_= Bool}
  ; Attribute {name= "crossOrigin"; htmlName= "crossorigin"; type_= String}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "formAction"; htmlName= "formaction"; type_= String}
  ; Attribute {name= "formEncType"; htmlName= "formenctype"; type_= String}
  ; Attribute {name= "formMethod"; htmlName= "formmethod"; type_= String}
  ; Attribute {name= "formNoValidate"; htmlName= "formnovalidate"; type_= Bool}
  ; Attribute {name= "formTarget"; htmlName= "formtarget"; type_= String}
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "list"; htmlName= "list"; type_= String}
  ; Attribute {name= "max"; htmlName= "max"; type_= String (* number |  *)}
  ; Attribute {name= "maxLength"; htmlName= "maxlength"; type_= Int (* number *)}
  ; Attribute {name= "min"; htmlName= "min"; type_= String (* number |  *)}
  ; Attribute {name= "minLength"; htmlName= "minlength"; type_= Int (* number *)}
  ; Attribute {name= "multiple"; htmlName= "multiple"; type_= Bool}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "pattern"; htmlName= "pattern"; type_= String}
  ; Attribute {name= "placeholder"; htmlName= "placeholder"; type_= String}
  ; Attribute {name= "readOnly"; htmlName= "readonly"; type_= Bool}
  ; Attribute {name= "required"; htmlName= "required"; type_= Bool}
  ; Attribute {name= "size"; htmlName= "size"; type_= Int (* number *)}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "step"; htmlName= "step"; type_= String (* number |  *)}
  ; Attribute {name= "type"; htmlName= "type"; type_= inputTypeAttribute}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) }
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ; Event {name= "onChange"; type_= Form} ]

let keygenHTMLAttributes =
  [ Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "challenge"; htmlName= "challenge"; type_= String}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "keyType"; htmlName= "keytype"; type_= String}
  ; Attribute {name= "keyParams"; htmlName= "keyparams"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String} ]

let labelHTMLAttributes =
  [ Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "htmlFor"; htmlName= "htmlfor"; type_= String} ]

let liHTMLAttributes =
  [ Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let linkHTMLAttributes =
  [ Attribute {name= "as"; htmlName= "as"; type_= String}
  ; Attribute {name= "crossOrigin"; htmlName= "crossorigin"; type_= String}
  ; Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute {name= "hrefLang"; htmlName= "hreflang"; type_= String}
  ; Attribute {name= "integrity"; htmlName= "integrity"; type_= String}
  ; Attribute {name= "imageSrcSet"; htmlName= "imagesrcset"; type_= String}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "rel"; htmlName= "rel"; type_= String}
  ; Attribute {name= "sizes"; htmlName= "sizes"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute {name= "charSet"; htmlName= "charset"; type_= String} ]

let mapHTMLAttributes =
  [Attribute {name= "name"; htmlName= "name"; type_= String}]

let menuHTMLAttributes =
  [Attribute {name= "type"; htmlName= "type"; type_= String}]

let mediaHTMLAttributes =
  [ Attribute {name= "autoPlay"; htmlName= "autoplay"; type_= Bool}
  ; Attribute {name= "controls"; htmlName= "controls"; type_= Bool}
  ; Attribute {name= "controlsList"; htmlName= "controlslist"; type_= String}
  ; Attribute {name= "crossOrigin"; htmlName= "crossorigin"; type_= String}
  ; Attribute {name= "loop"; htmlName= "loop"; type_= Bool}
  ; Attribute {name= "mediaGroup"; htmlName= "mediagroup"; type_= String}
  ; Attribute {name= "muted"; htmlName= "muted"; type_= Bool}
  ; Attribute {name= "playsInline"; htmlName= "playsinline"; type_= Bool}
  ; Attribute {name= "preload"; htmlName= "preload"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String} ]

let metaHTMLAttributes =
  [ Attribute {name= "charSet"; htmlName= "charset"; type_= String}
  ; Attribute {name= "content"; htmlName= "content"; type_= String}
  ; Attribute {name= "httpEquiv"; htmlName= "httpequiv"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "media"; htmlName= "media"; type_= String} ]

let meterHTMLAttributes =
  [ Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "high"; htmlName= "high"; type_= Int (* number *)}
  ; Attribute {name= "low"; htmlName= "low"; type_= Int (* number *)}
  ; Attribute {name= "max"; htmlName= "max"; type_= String (* number |  *)}
  ; Attribute {name= "min"; htmlName= "min"; type_= String (* number |  *)}
  ; Attribute {name= "optimum"; htmlName= "optimum"; type_= Int (* number *)}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let quoteHTMLAttributes =
  [Attribute {name= "cite"; htmlName= "cite"; type_= String}]

let objectHTMLAttributes =
  [ Attribute {name= "classID"; htmlName= "classid"; type_= String}
  ; Attribute {name= "data"; htmlName= "data"; type_= String}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute {name= "useMap"; htmlName= "usemap"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ; Attribute {name= "wmode"; htmlName= "wmode"; type_= String} ]

let olHTMLAttributes =
  [ Attribute {name= "reversed"; htmlName= "reversed"; type_= Bool}
  ; Attribute {name= "start"; htmlName= "start"; type_= Int (* number *)}
  ; Attribute
      { name= "type_"
      ; htmlName= "type"
      ; type_= String (* '1' | 'a' | 'A' | 'i' | 'I' *) } ]

let optgroupHTMLAttributes =
  [ Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "label"; htmlName= "label"; type_= String} ]

let optionHTMLAttributes =
  [ Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "label"; htmlName= "label"; type_= String}
  ; Attribute {name= "selected"; htmlName= "selected"; type_= Bool}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let outputHTMLAttributes =
  [ Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "htmlFor"; htmlName= "htmlfor"; type_= String}
  ; Attribute {name= "name"; htmlName= "name"; type_= String} ]

let paramHTMLAttributes =
  [ Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let progressHTMLAttributes =
  [ Attribute {name= "max"; htmlName= "max"; type_= String (* number |  *)}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) } ]

let slotHTMLAttributes =
  [Attribute {name= "name"; htmlName= "name"; type_= String}]

let scriptHTMLAttributes =
  [ Attribute {name= "async"; htmlName= "async"; type_= Bool} (* @deprecated *)
  ; Attribute {name= "charSet"; htmlName= "charset"; type_= String}
  ; Attribute {name= "crossOrigin"; htmlName= "crossorigin"; type_= String}
  ; Attribute {name= "defer"; htmlName= "defer"; type_= Bool}
  ; Attribute {name= "integrity"; htmlName= "integrity"; type_= String}
  ; Attribute {name= "noModule"; htmlName= "nomodule"; type_= Bool}
  ; Attribute {name= "nonce"; htmlName= "nonce"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String} ]

let selectHTMLAttributes =
  [ Attribute {name= "autoComplete"; htmlName= "autocomplete"; type_= String}
  ; Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "multiple"; htmlName= "multiple"; type_= Bool}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "required"; htmlName= "required"; type_= Bool}
  ; Attribute {name= "size"; htmlName= "size"; type_= Int (* number *)}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) }
  ; Event {name= "onChange"; type_= Form} ]

let sourceHTMLAttributes =
  [ Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "sizes"; htmlName= "sizes"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "srcSet"; htmlName= "srcset"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let styleHTMLAttributes =
  [ Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "nonce"; htmlName= "nonce"; type_= String}
  ; Attribute {name= "scoped"; htmlName= "scoped"; type_= Bool}
  ; Attribute {name= "type"; htmlName= "type"; type_= String} ]

let tableHTMLAttributes =
  [ Attribute
      { name= "cellPadding"
      ; htmlName= "cellpadding"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "cellSpacing"
      ; htmlName= "cellspacing"
      ; type_= String (* number |  *) }
  ; Attribute {name= "summary"; htmlName= "summary"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ]

let textareaHTMLAttributes =
  [ Attribute {name= "autoComplete"; htmlName= "autocomplete"; type_= String}
  ; Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "cols"; htmlName= "cols"; type_= Int (* number *)}
  ; Attribute {name= "dirName"; htmlName= "dirname"; type_= String}
  ; Attribute {name= "disabled"; htmlName= "disabled"; type_= Bool}
  ; Attribute {name= "form"; htmlName= "form"; type_= String}
  ; Attribute {name= "maxLength"; htmlName= "maxlength"; type_= Int (* number *)}
  ; Attribute {name= "minLength"; htmlName= "minlength"; type_= Int (* number *)}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "placeholder"; htmlName= "placeholder"; type_= String}
  ; Attribute {name= "readOnly"; htmlName= "readonly"; type_= Bool}
  ; Attribute {name= "required"; htmlName= "required"; type_= Bool}
  ; Attribute {name= "rows"; htmlName= "rows"; type_= Int (* number *)}
  ; Attribute
      { name= "value"
      ; htmlName= "value"
      ; type_= String (* | ReadonlyArray<String> | number *) }
  ; Attribute {name= "wrap"; htmlName= "wrap"; type_= String}
  ; Event {name= "onChange"; type_= Form} ]

let tdHTMLAttributes =
  [ Attribute
      { name= "align"
      ; htmlName= "align"
      ; type_=
          String (* type_= "left" | "center" | "right" | "justify" | "char" *)
      }
  ; Attribute {name= "colSpan"; htmlName= "colspan"; type_= Int (* number *)}
  ; Attribute {name= "headers"; htmlName= "headers"; type_= String}
  ; Attribute {name= "rowSpan"; htmlName= "rowspan"; type_= Int (* number *)}
  ; Attribute {name= "scope"; htmlName= "scope"; type_= String}
  ; Attribute {name= "abbr"; htmlName= "abbr"; type_= String}
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ; Attribute
      { name= "valign"
      ; htmlName= "valign"
      ; type_= String (* "top" | "middle" | "bottom" | "baseline" *) } ]

let thHTMLAttributes =
  [ Attribute
      { name= "align"
      ; htmlName= "align"
      ; type_= String (* "left" | "center" | "right" | "justify" | "char" *) }
  ; Attribute {name= "colSpan"; htmlName= "colspan"; type_= Int (* number *)}
  ; Attribute {name= "headers"; htmlName= "headers"; type_= String}
  ; Attribute {name= "rowSpan"; htmlName= "rowspan"; type_= Int (* number *)}
  ; Attribute {name= "scope"; htmlName= "scope"; type_= String}
  ; Attribute {name= "abbr"; htmlName= "abbr"; type_= String} ]

let timeHTMLAttributes =
  [Attribute {name= "dateTime"; htmlName= "datetime"; type_= String}]

let trackHTMLAttributes =
  [ Attribute {name= "default"; htmlName= "default"; type_= Bool}
  ; Attribute {name= "kind"; htmlName= "kind"; type_= String}
  ; Attribute {name= "label"; htmlName= "label"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "srcLang"; htmlName= "srclang"; type_= String} ]

let videoHTMLAttributes =
  [ Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "playsInline"; htmlName= "playsinline"; type_= Bool}
  ; Attribute {name= "poster"; htmlName= "poster"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
  ; Attribute
      { name= "disablePictureInPicture"
      ; htmlName= "disablepictureinpicture"
      ; type_= Bool } ]

(* (* this list is "complete" in that it contains every SVG attribute *)
   // that React supports, but the types can be improved.
   // Full list here: https://facebook.github.io/react/docs/dom-elements.html
   //
   // The three broad type categories are (in order of restrictiveness):
   //   - "(* number |  *)String"
   //   - "String"
   //   - union of String literals *)
let svgAttributes =
  [ (* Attributes which also defined in HTMLAttributes *)
    (* See comment in SVGDOMPropertyConfig.js *)
    Attribute {name= "className"; htmlName= "className"; type_= String}
  ; Attribute {name= "color"; htmlName= "color"; type_= String}
  ; Attribute {name= "height"; htmlName= "height"; type_= String (* number |  *)}
  ; Attribute {name= "id"; htmlName= "id"; type_= String}
  ; Attribute {name= "lang"; htmlName= "lang"; type_= String}
  ; Attribute {name= "max"; htmlName= "max"; type_= String (* number |  *)}
  ; Attribute {name= "media"; htmlName= "media"; type_= String}
  ; Attribute {name= "method"; htmlName= "method"; type_= String}
  ; Attribute {name= "min"; htmlName= "min"; type_= String (* number |  *)}
  ; Attribute {name= "name"; htmlName= "name"; type_= String}
  ; Attribute {name= "style"; htmlName= "style"; type_= Style}
  ; Attribute {name= "target"; htmlName= "target"; type_= String}
  ; Attribute {name= "type"; htmlName= "type"; type_= String}
  ; Attribute {name= "width"; htmlName= "width"; type_= String (* number |  *)}
    (* Other HTML properties supported by SVG elements in browsers *)
  ; Attribute {name= "role"; htmlName= "role"; type_= ariaRole}
  ; Attribute {name= "tabIndex"; htmlName= "tabIndex"; type_= Int (* number *)}
  ; Attribute
      { name= "crossOrigin"
      ; htmlName= "crossOrigin"
      ; type_= String (* "anonymous" | "use-credentials" | "" *) }
    (* SVG Specific attributes *)
  ; Attribute
      { name= "accentHeight"
      ; htmlName= "accentHeight"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "accumulate"
      ; htmlName= "accumulate"
      ; type_= String (* type_= "none" | "sum" *) }
  ; Attribute
      { name= "additive"
      ; htmlName= "additive"
      ; type_= String (* type_= "replace" | "sum" *) }
  ; Attribute
      { name= "alignmentBaseline"
      ; htmlName= "alignmentBaseline"
      ; type_=
          String
          (* "auto" | "baseline" | "before-edge" | "text-before-edge" | "middle" | "central" | "after-edge" "text-after-edge" | "ideographic" | "alphabetic" | "hanging" | "mathematical" | "inherit" *)
      }
  ; Attribute
      { name= "allowReorder"
      ; htmlName= "allowReorder"
      ; type_= String (* type_= "no" | "yes" *) }
  ; Attribute
      {name= "alphabetic"; htmlName= "alphabetic"; type_= String (* number |  *)}
  ; Attribute
      {name= "amplitude"; htmlName= "amplitude"; type_= String (* number |  *)}
  ; Attribute
      { name= "arabicForm"
      ; htmlName= "arabicForm"
      ; type_=
          String (* type_= "initial" | "medial" | "terminal" | "isolated" *) }
  ; Attribute {name= "ascent"; htmlName= "ascent"; type_= String (* number |  *)}
  ; Attribute {name= "attributeName"; htmlName= "attributeName"; type_= String}
  ; Attribute {name= "attributeType"; htmlName= "attributeType"; type_= String}
  ; Attribute
      { name= "autoReverse"
      ; htmlName= "autoReverse"
      ; type_= String (* Booleanish *) }
  ; Attribute
      {name= "azimuth"; htmlName= "azimuth"; type_= String (* number |  *)}
  ; Attribute
      { name= "baseProfile"
      ; htmlName= "baseProfile"
      ; type_= String (* number |  *) }
  ; Attribute {name= "bbox"; htmlName= "bbox"; type_= String (* number |  *)}
  ; Attribute {name= "begin"; htmlName= "begin"; type_= String (* number |  *)}
  ; Attribute {name= "bias"; htmlName= "bias"; type_= String (* number |  *)}
  ; Attribute {name= "by"; htmlName= "by"; type_= String (* number |  *)}
  ; Attribute
      {name= "calcMode"; htmlName= "calcMode"; type_= String (* number |  *)}
  ; Attribute
      {name= "capHeight"; htmlName= "capHeight"; type_= String (* number |  *)}
  ; Attribute {name= "clip"; htmlName= "clip"; type_= String (* number |  *)}
  ; Attribute {name= "clipPath"; htmlName= "clipPath"; type_= String}
  ; Attribute
      { name= "clipRule"
      ; htmlName= "clipRule"
      ; type_= (* number | "linearRGB" | "inherit" *) String }
  ; Attribute
      { name= "colorProfile"
      ; htmlName= "colorProfile"
      ; type_= String (* number |  *) }
  ; Attribute {name= "cursor"; htmlName= "cursor"; type_= String (* number |  *)}
  ; Attribute {name= "cx"; htmlName= "cx"; type_= String (* number |  *)}
  ; Attribute {name= "cy"; htmlName= "cy"; type_= String (* number |  *)}
  ; Attribute {name= "d"; htmlName= "d"; type_= String}
  ; Attribute
      {name= "decelerate"; htmlName= "decelerate"; type_= String (* number |  *)}
  ; Attribute
      {name= "descent"; htmlName= "descent"; type_= String (* number |  *)}
  ; Attribute
      {name= "direction"; htmlName= "direction"; type_= String (* number |  *)}
  ; Attribute
      {name= "display"; htmlName= "display"; type_= String (* number |  *)}
  ; Attribute
      {name= "divisor"; htmlName= "divisor"; type_= String (* number |  *)}
  ; Attribute {name= "dur"; htmlName= "dur"; type_= String (* number |  *)}
  ; Attribute {name= "dx"; htmlName= "dx"; type_= String (* number |  *)}
  ; Attribute {name= "dy"; htmlName= "dy"; type_= String (* number |  *)}
  ; Attribute
      {name= "edgeMode"; htmlName= "edgeMode"; type_= String (* number |  *)}
  ; Attribute
      {name= "elevation"; htmlName= "elevation"; type_= String (* number |  *)}
  ; Attribute {name= "end"; htmlName= "end"; type_= String (* number |  *)}
  ; Attribute
      {name= "exponent"; htmlName= "exponent"; type_= String (* number |  *)}
  ; Attribute
      { name= "externalResourcesRequired"
      ; htmlName= "externalResourcesRequired"
      ; type_= String (* Booleanish *) }
  ; Attribute {name= "fill"; htmlName= "fill"; type_= String}
  ; Attribute
      { name= "fillOpacity"
      ; htmlName= "fillOpacity"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "fillRule"
      ; htmlName= "fillRule"
      ; type_= String (* type_= "nonzero" | "evenodd" | "inherit" *) }
  ; Attribute {name= "filter"; htmlName= "filter"; type_= String}
  ; Attribute
      {name= "filterRes"; htmlName= "filterRes"; type_= String (* number |  *)}
  ; Attribute
      { name= "filterUnits"
      ; htmlName= "filterUnits"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "floodColor"; htmlName= "floodColor"; type_= String (* number |  *)}
  ; Attribute
      { name= "floodOpacity"
      ; htmlName= "floodOpacity"
      ; type_= String (* number |  *) }
  ; Attribute {name= "fontFamily"; htmlName= "fontFamily"; type_= String}
  ; Attribute
      {name= "fontSize"; htmlName= "fontSize"; type_= String (* number |  *)}
  ; Attribute
      { name= "fontStretch"
      ; htmlName= "fontStretch"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "fontStyle"; htmlName= "fontStyle"; type_= String (* number |  *)}
  ; Attribute
      { name= "fontVariant"
      ; htmlName= "fontVariant"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "fontWeight"; htmlName= "fontWeight"; type_= String (* number |  *)}
  ; Attribute {name= "format"; htmlName= "format"; type_= String (* number |  *)}
  ; Attribute {name= "fr"; htmlName= "fr"; type_= String (* number |  *)}
  ; Attribute {name= "from"; htmlName= "from"; type_= String (* number |  *)}
  ; Attribute {name= "fx"; htmlName= "fx"; type_= String (* number |  *)}
  ; Attribute {name= "fy"; htmlName= "fy"; type_= String (* number |  *)}
  ; Attribute {name= "g1"; htmlName= "g1"; type_= String (* number |  *)}
  ; Attribute {name= "g2"; htmlName= "g2"; type_= String (* number |  *)}
  ; Attribute
      {name= "glyphName"; htmlName= "glyphName"; type_= String (* number |  *)}
  ; Attribute
      { name= "glyphOrientationHorizontal"
      ; htmlName= "glyphOrientationHorizontal"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "glyphOrientationVertical"
      ; htmlName= "glyphOrientationVertical"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "glyphRef"; htmlName= "glyphRef"; type_= String (* number |  *)}
  ; Attribute
      {name= "gradientTransform"; htmlName= "gradientTransform"; type_= String}
  ; Attribute {name= "gradientUnits"; htmlName= "gradientUnits"; type_= String}
  ; Attribute
      {name= "hanging"; htmlName= "hanging"; type_= String (* number |  *)}
  ; Attribute
      {name= "horizAdvX"; htmlName= "horizAdvX"; type_= String (* number |  *)}
  ; Attribute
      { name= "horizOriginX"
      ; htmlName= "horizOriginX"
      ; type_= String (* number |  *) }
  ; Attribute {name= "href"; htmlName= "href"; type_= String}
  ; Attribute
      { name= "ideographic"
      ; htmlName= "ideographic"
      ; type_= String (* number |  *) }
  ; Attribute {name= "in2"; htmlName= "in2"; type_= String (* number |  *)}
  ; Attribute {name= "in"; htmlName= "in"; type_= String}
  ; Attribute
      {name= "intercept"; htmlName= "intercept"; type_= String (* number |  *)}
  ; Attribute {name= "k1"; htmlName= "k1"; type_= String (* number |  *)}
  ; Attribute {name= "k2"; htmlName= "k2"; type_= String (* number |  *)}
  ; Attribute {name= "k3"; htmlName= "k3"; type_= String (* number |  *)}
  ; Attribute {name= "k4"; htmlName= "k4"; type_= String (* number |  *)}
  ; Attribute {name= "k"; htmlName= "k"; type_= String (* number |  *)}
  ; Attribute
      { name= "kernelMatrix"
      ; htmlName= "kernelMatrix"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "kerning"; htmlName= "kerning"; type_= String (* number |  *)}
  ; Attribute
      {name= "keyPoints"; htmlName= "keyPoints"; type_= String (* number |  *)}
  ; Attribute
      {name= "keySplines"; htmlName= "keySplines"; type_= String (* number |  *)}
  ; Attribute
      {name= "keyTimes"; htmlName= "keyTimes"; type_= String (* number |  *)}
  ; Attribute
      { name= "lengthAdjust"
      ; htmlName= "lengthAdjust"
      ; type_= String (* number |  *) }
  ; Attribute {name= "local"; htmlName= "local"; type_= String (* number |  *)}
  ; Attribute {name= "markerEnd"; htmlName= "markerEnd"; type_= String}
  ; Attribute
      { name= "markerHeight"
      ; htmlName= "markerHeight"
      ; type_= String (* number |  *) }
  ; Attribute {name= "markerMid"; htmlName= "markerMid"; type_= String}
  ; Attribute {name= "markerStart"; htmlName= "markerStart"; type_= String}
  ; Attribute
      { name= "markerUnits"
      ; htmlName= "markerUnits"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "markerWidth"
      ; htmlName= "markerWidth"
      ; type_= String (* number |  *) }
  ; Attribute {name= "mask"; htmlName= "mask"; type_= String}
  ; Attribute
      {name= "maskUnits"; htmlName= "maskUnits"; type_= String (* number |  *)}
  ; Attribute
      { name= "mathematical"
      ; htmlName= "mathematical"
      ; type_= String (* number |  *) }
  ; Attribute {name= "mode"; htmlName= "mode"; type_= String (* number |  *)}
  ; Attribute
      {name= "numOctaves"; htmlName= "numOctaves"; type_= String (* number |  *)}
  ; Attribute {name= "offset"; htmlName= "offset"; type_= String (* number |  *)}
  ; Attribute
      {name= "opacity"; htmlName= "opacity"; type_= String (* number |  *)}
  ; Attribute
      {name= "operator"; htmlName= "operator"; type_= String (* number |  *)}
  ; Attribute {name= "order"; htmlName= "order"; type_= String (* number |  *)}
  ; Attribute {name= "orient"; htmlName= "orient"; type_= String (* number |  *)}
  ; Attribute
      { name= "orientation"
      ; htmlName= "orientation"
      ; type_= String (* number |  *) }
  ; Attribute {name= "origin"; htmlName= "origin"; type_= String (* number |  *)}
  ; Attribute
      {name= "overflow"; htmlName= "overflow"; type_= String (* number |  *)}
  ; Attribute
      {name= "paintOrder"; htmlName= "paintOrder"; type_= String (* number |  *)}
  ; Attribute
      {name= "panose1"; htmlName= "panose1"; type_= String (* number |  *)}
  ; Attribute {name= "path"; htmlName= "path"; type_= String}
  ; Attribute
      {name= "pathLength"; htmlName= "pathLength"; type_= String (* number |  *)}
  ; Attribute
      { name= "patternContentUnits"
      ; htmlName= "patternContentUnits"
      ; type_= String }
  ; Attribute {name= "patternUnits"; htmlName= "patternUnits"; type_= String}
  ; Attribute {name= "points"; htmlName= "points"; type_= String}
  ; Attribute
      {name= "pointsAtX"; htmlName= "pointsAtX"; type_= String (* number |  *)}
  ; Attribute
      {name= "pointsAtY"; htmlName= "pointsAtY"; type_= String (* number |  *)}
  ; Attribute
      {name= "pointsAtZ"; htmlName= "pointsAtZ"; type_= String (* number |  *)}
  ; Attribute
      { name= "preserveAspectRatio"
      ; htmlName= "preserveAspectRatio"
      ; type_= String }
  ; Attribute {name= "r"; htmlName= "r"; type_= String (* number |  *)}
  ; Attribute {name= "radius"; htmlName= "radius"; type_= String (* number |  *)}
  ; Attribute {name= "refX"; htmlName= "refX"; type_= String (* number |  *)}
  ; Attribute {name= "refY"; htmlName= "refY"; type_= String (* number |  *)}
  ; Attribute
      { name= "repeatCount"
      ; htmlName= "repeatCount"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "repeatDur"; htmlName= "repeatDur"; type_= String (* number |  *)}
  ; Attribute
      {name= "restart"; htmlName= "restart"; type_= String (* number |  *)}
  ; Attribute {name= "result"; htmlName= "result"; type_= String}
  ; Attribute {name= "rotate"; htmlName= "rotate"; type_= String (* number |  *)}
  ; Attribute {name= "rx"; htmlName= "rx"; type_= String (* number |  *)}
  ; Attribute {name= "ry"; htmlName= "ry"; type_= String (* number |  *)}
  ; Attribute {name= "scale"; htmlName= "scale"; type_= String (* number |  *)}
  ; Attribute {name= "seed"; htmlName= "seed"; type_= String (* number |  *)}
  ; Attribute {name= "slope"; htmlName= "slope"; type_= String (* number |  *)}
  ; Attribute
      {name= "spacing"; htmlName= "spacing"; type_= String (* number |  *)}
  ; Attribute {name= "speed"; htmlName= "speed"; type_= String (* number |  *)}
  ; Attribute {name= "spreadMethod"; htmlName= "spreadMethod"; type_= String}
  ; Attribute
      { name= "startOffset"
      ; htmlName= "startOffset"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "stdDeviation"
      ; htmlName= "stdDeviation"
      ; type_= String (* number |  *) }
  ; Attribute {name= "stemh"; htmlName= "stemh"; type_= String (* number |  *)}
  ; Attribute {name= "stemv"; htmlName= "stemv"; type_= String (* number |  *)}
  ; Attribute
      { name= "stitchTiles"
      ; htmlName= "stitchTiles"
      ; type_= String (* number |  *) }
  ; Attribute {name= "stopColor"; htmlName= "stopColor"; type_= String}
  ; Attribute
      { name= "stopOpacity"
      ; htmlName= "stopOpacity"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "strikethroughPosition"
      ; htmlName= "strikethroughPosition"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "strikethroughThickness"
      ; htmlName= "strikethroughThickness"
      ; type_= String (* number |  *) }
  ; Attribute {name= "String"; htmlName= "String"; type_= String (* number |  *)}
  ; Attribute {name= "stroke"; htmlName= "stroke"; type_= String}
  ; Attribute
      { name= "strokeLinecap"
      ; htmlName= "strokeLinecap"
      ; type_= String (* type_= "butt" | "round" | "square" | "inherit" *) }
  ; Attribute
      { name= "strokeWidth"
      ; htmlName= "strokeWidth"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "surfaceScale"
      ; htmlName= "surfaceScale"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "tableValues"
      ; htmlName= "tableValues"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "targetX"; htmlName= "targetX"; type_= String (* number |  *)}
  ; Attribute
      {name= "targetY"; htmlName= "targetY"; type_= String (* number |  *)}
  ; Attribute {name= "textAnchor"; htmlName= "textAnchor"; type_= String}
  ; Attribute
      {name= "textLength"; htmlName= "textLength"; type_= String (* number |  *)}
  ; Attribute {name= "to"; htmlName= "to"; type_= String (* number |  *)}
  ; Attribute {name= "transform"; htmlName= "transform"; type_= String}
  ; Attribute {name= "u1"; htmlName= "u1"; type_= String (* number |  *)}
  ; Attribute {name= "u2"; htmlName= "u2"; type_= String (* number |  *)}
  ; Attribute
      {name= "unicode"; htmlName= "unicode"; type_= String (* number |  *)}
  ; Attribute
      { name= "unicodeBidi"
      ; htmlName= "unicodeBidi"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "unicodeRange"
      ; htmlName= "unicodeRange"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "unitsPerEm"; htmlName= "unitsPerEm"; type_= String (* number |  *)}
  ; Attribute
      { name= "vAlphabetic"
      ; htmlName= "vAlphabetic"
      ; type_= String (* number |  *) }
  ; Attribute {name= "values"; htmlName= "values"; type_= String}
  ; Attribute
      { name= "vectorEffect"
      ; htmlName= "vectorEffect"
      ; type_= String (* number |  *) }
  ; Attribute {name= "version"; htmlName= "version"; type_= String}
  ; Attribute
      {name= "vertAdvY"; htmlName= "vertAdvY"; type_= String (* number |  *)}
  ; Attribute
      { name= "vertOriginX"
      ; htmlName= "vertOriginX"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "vertOriginY"
      ; htmlName= "vertOriginY"
      ; type_= String (* number |  *) }
  ; Attribute
      {name= "vHanging"; htmlName= "vHanging"; type_= String (* number |  *)}
  ; Attribute
      { name= "vIdeographic"
      ; htmlName= "vIdeographic"
      ; type_= String (* number |  *) }
  ; Attribute {name= "viewBox"; htmlName= "viewBox"; type_= String}
  ; Attribute
      {name= "viewTarget"; htmlName= "viewTarget"; type_= String (* number |  *)}
  ; Attribute
      {name= "visibility"; htmlName= "visibility"; type_= String (* number |  *)}
  ; Attribute {name= "widths"; htmlName= "widths"; type_= String (* number |  *)}
  ; Attribute
      { name= "wordSpacing"
      ; htmlName= "wordSpacing"
      ; type_= String (* number |  *) }
  ; Attribute
      { name= "writingMode"
      ; htmlName= "writingMode"
      ; type_= String (* number |  *) }
  ; Attribute {name= "x1"; htmlName= "x1"; type_= String (* number |  *)}
  ; Attribute {name= "x2"; htmlName= "x2"; type_= String (* number |  *)}
  ; Attribute {name= "x"; htmlName= "x"; type_= String (* number |  *)}
  ; Attribute
      {name= "xChannelSelector"; htmlName= "xChannelSelector"; type_= String}
  ; Attribute
      {name= "xHeight"; htmlName= "xHeight"; type_= String (* number |  *)}
  ; Attribute {name= "xlinkActuate"; htmlName= "xlinkActuate"; type_= String}
  ; Attribute {name= "xlinkArcrole"; htmlName= "xlinkArcrole"; type_= String}
  ; Attribute {name= "xlinkHref"; htmlName= "xlinkHref"; type_= String}
  ; Attribute {name= "xlinkRole"; htmlName= "xlinkRole"; type_= String}
  ; Attribute {name= "xlinkShow"; htmlName= "xlinkShow"; type_= String}
  ; Attribute {name= "xlinkTitle"; htmlName= "xlinkTitle"; type_= String}
  ; Attribute {name= "xlinkType"; htmlName= "xlinkType"; type_= String}
  ; Attribute {name= "xmlBase"; htmlName= "xmlBase"; type_= String}
  ; Attribute {name= "xmlLang"; htmlName= "xmlLang"; type_= String}
  ; Attribute {name= "xmlns"; htmlName= "xmlns"; type_= String}
  ; Attribute {name= "xmlnsXlink"; htmlName= "xmlnsXlink"; type_= String}
  ; Attribute {name= "xmlSpace"; htmlName= "xmlSpace"; type_= String}
  ; Attribute {name= "y1"; htmlName= "y1"; type_= String (* number |  *)}
  ; Attribute {name= "y2"; htmlName= "y2"; type_= String (* number |  *)}
  ; Attribute {name= "y"; htmlName= "y"; type_= String (* number |  *)}
  ; Attribute
      {name= "yChannelSelector"; htmlName= "yChannelSelector"; type_= String}
  ; Attribute {name= "z"; htmlName= "z"; type_= String (* number |  *)}
  ; Attribute {name= "zoomAndPan"; htmlName= "zoomAndPan"; type_= String} ]

let webViewHTMLAttributes =
  [ Attribute {name= "allowFullScreen"; htmlName= "allowfullscreen"; type_= Bool}
  ; Attribute {name= "allowpopups"; htmlName= "allowpopups"; type_= Bool}
  ; Attribute {name= "autoFocus"; htmlName= "autofocus"; type_= Bool}
  ; Attribute {name= "autosize"; htmlName= "autosize"; type_= Bool}
  ; Attribute {name= "blinkfeatures"; htmlName= "blinkfeatures"; type_= String}
  ; Attribute
      { name= "disableblinkfeatures"
      ; htmlName= "disableblinkfeatures"
      ; type_= String }
  ; Attribute
      {name= "disableguestresize"; htmlName= "disableguestresize"; type_= Bool}
  ; Attribute
      {name= "disablewebsecurity"; htmlName= "disablewebsecurity"; type_= Bool}
  ; Attribute {name= "guestinstance"; htmlName= "guestinstance"; type_= String}
  ; Attribute {name= "httpreferrer"; htmlName= "httpreferrer"; type_= String}
  ; Attribute {name= "nodeintegration"; htmlName= "nodeintegration"; type_= Bool}
  ; Attribute {name= "partition"; htmlName= "partition"; type_= String}
  ; Attribute {name= "plugins"; htmlName= "plugins"; type_= Bool}
  ; Attribute {name= "preload"; htmlName= "preload"; type_= String}
  ; Attribute {name= "src"; htmlName= "src"; type_= String}
  ; Attribute {name= "useragent"; htmlName= "useragent"; type_= String}
  ; Attribute {name= "webpreferences"; htmlName= "webpreferences"; type_= String}
  ]

(* Browser Interfaces https://github.com/nikeee/2048-typescript/blob/master/2048/js/touch.d.ts *)
let abstractView = []
(* {
       styleMedia: StyleMedia;
       document: Document;
   ] *)

let touch = []
(* {
       identifier: number;
       target: EventTarget;
       screenX: number;
       screenY: number;
       clientX: number;
       clientY: number;
       pageX: number;
       pageY: number;
   ]
*)

let touchList = []
(* {
       [index: number]: Touch;
       length: number;
       item(index: number): Touch;
       identifiedTouch(identifier: number): Touch;
   ] *)

(* Error Interfaces *)
let errorInfo = []
(* {
      /**
       * Captures which component contained the exception, and its ancestors.
       */
      componentStack: string; *)

let htmlElements =
  [ {tag= "a"; attributes= domAttributes & anchorHTMLAttributes & attributesHTML}
  ; {tag= "abbr"; attributes= domAttributes & attributesHTML}
  ; {tag= "address"; attributes= domAttributes & attributesHTML}
  ; {tag= "area"; attributes= domAttributes & areaHTMLAttributes}
  ; {tag= "article"; attributes= domAttributes & attributesHTML}
  ; {tag= "aside"; attributes= domAttributes & attributesHTML}
  ; {tag= "audio"; attributes= domAttributes & audioHTMLAttributes}
  ; {tag= "b"; attributes= domAttributes & attributesHTML}
  ; {tag= "base"; attributes= domAttributes & baseHTMLAttributes}
  ; {tag= "bdi"; attributes= domAttributes & attributesHTML}
  ; {tag= "bdo"; attributes= domAttributes & attributesHTML}
  ; {tag= "big"; attributes= domAttributes & attributesHTML}
  ; {tag= "blockquote"; attributes= blockquoteHTMLAttributes}
  ; {tag= "body"; attributes= domAttributes & attributesHTML}
  ; {tag= "br"; attributes= domAttributes & attributesHTML}
  ; {tag= "button"; attributes= buttonHTMLAttributes}
  ; {tag= "canvas"; attributes= canvasHTMLAttributes}
  ; {tag= "caption"; attributes= domAttributes & attributesHTML}
  ; {tag= "cite"; attributes= domAttributes & attributesHTML}
  ; {tag= "code"; attributes= domAttributes & attributesHTML}
  ; {tag= "col"; attributes= domAttributes & colHTMLAttributes}
  ; {tag= "colgroup"; attributes= colgroupHTMLAttributes}
  ; {tag= "data"; attributes= domAttributes & dataHTMLAttributes}
  ; {tag= "datalist"; attributes= domAttributes & attributesHTML}
  ; {tag= "dd"; attributes= domAttributes & attributesHTML}
  ; {tag= "del"; attributes= domAttributes & delHTMLAttributes}
  ; {tag= "details"; attributes= domAttributes & detailsHTMLAttributes}
  ; {tag= "dfn"; attributes= domAttributes & attributesHTML}
  ; {tag= "dialog"; attributes= domAttributes & dialogHTMLAttributes}
  ; {tag= "div"; attributes= domAttributes & attributesHTML}
  ; {tag= "dl"; attributes= domAttributes & attributesHTML}
  ; {tag= "dt"; attributes= domAttributes & attributesHTML}
  ; {tag= "em"; attributes= domAttributes & attributesHTML}
  ; {tag= "embed"; attributes= domAttributes & embedHTMLAttributes}
  ; {tag= "fieldset"; attributes= domAttributes & fieldsetHTMLAttributes}
  ; {tag= "figcaption"; attributes= domAttributes & attributesHTML}
  ; {tag= "figure"; attributes= domAttributes & attributesHTML}
  ; {tag= "footer"; attributes= domAttributes & attributesHTML}
  ; {tag= "form"; attributes= domAttributes & formHTMLAttributes}
  ; {tag= "h1"; attributes= domAttributes & attributesHTML}
  ; {tag= "h2"; attributes= domAttributes & attributesHTML}
  ; {tag= "h3"; attributes= domAttributes & attributesHTML}
  ; {tag= "h4"; attributes= domAttributes & attributesHTML}
  ; {tag= "h5"; attributes= domAttributes & attributesHTML}
  ; {tag= "h6"; attributes= domAttributes & attributesHTML}
  ; {tag= "head"; attributes= domAttributes & attributesHTML}
  ; {tag= "header"; attributes= domAttributes & attributesHTML}
  ; {tag= "hgroup"; attributes= domAttributes & attributesHTML}
  ; {tag= "hr"; attributes= domAttributes & attributesHTML}
  ; {tag= "html"; attributes= domAttributes & htmlHTMLAttributes}
  ; {tag= "i"; attributes= domAttributes & attributesHTML}
  ; {tag= "iframe"; attributes= domAttributes & iframeHTMLAttributes}
  ; {tag= "img"; attributes= domAttributes & imgHTMLAttributes}
  ; {tag= "input"; attributes= domAttributes & inputHTMLAttributes}
  ; {tag= "ins"; attributes= domAttributes & insHTMLAttributes}
  ; {tag= "kbd"; attributes= domAttributes & attributesHTML}
  ; {tag= "keygen"; attributes= keygenHTMLAttributes}
  ; {tag= "label"; attributes= labelHTMLAttributes}
  ; {tag= "legend"; attributes= domAttributes & attributesHTML}
  ; {tag= "li"; attributes= domAttributes & liHTMLAttributes}
  ; {tag= "link"; attributes= linkHTMLAttributes}
  ; {tag= "main"; attributes= domAttributes & attributesHTML}
  ; {tag= "map"; attributes= domAttributes & mapHTMLAttributes}
  ; {tag= "mark"; attributes= domAttributes & attributesHTML}
  ; {tag= "menu"; attributes= domAttributes & menuHTMLAttributes}
  ; {tag= "menuitem"; attributes= domAttributes & attributesHTML}
  ; {tag= "meta"; attributes= domAttributes & metaHTMLAttributes}
  ; {tag= "meter"; attributes= domAttributes & meterHTMLAttributes}
  ; {tag= "nav"; attributes= domAttributes & attributesHTML}
  ; {tag= "noscript"; attributes= domAttributes & attributesHTML}
  ; {tag= "object"; attributes= domAttributes & objectHTMLAttributes}
  ; {tag= "ol"; attributes= domAttributes & olHTMLAttributes}
  ; {tag= "optgroup"; attributes= domAttributes & optgroupHTMLAttributes}
  ; {tag= "option"; attributes= domAttributes & optionHTMLAttributes}
  ; {tag= "output"; attributes= domAttributes & outputHTMLAttributes}
  ; {tag= "p"; attributes= domAttributes & attributesHTML}
  ; {tag= "param"; attributes= domAttributes & paramHTMLAttributes}
  ; {tag= "picture"; attributes= domAttributes & attributesHTML}
  ; {tag= "pre"; attributes= domAttributes & attributesHTML}
  ; {tag= "progress"; attributes= progressHTMLAttributes}
  ; {tag= "q"; attributes= domAttributes & quoteHTMLAttributes}
  ; {tag= "rp"; attributes= domAttributes & attributesHTML}
  ; {tag= "rt"; attributes= domAttributes & attributesHTML}
  ; {tag= "ruby"; attributes= domAttributes & attributesHTML}
  ; {tag= "s"; attributes= domAttributes & attributesHTML}
  ; {tag= "samp"; attributes= domAttributes & attributesHTML}
  ; {tag= "slot"; attributes= domAttributes & slotHTMLAttributes}
  ; {tag= "script"; attributes= domAttributes & scriptHTMLAttributes}
  ; {tag= "section"; attributes= domAttributes & attributesHTML}
  ; {tag= "select"; attributes= domAttributes & selectHTMLAttributes}
  ; {tag= "small"; attributes= domAttributes & attributesHTML}
  ; {tag= "source"; attributes= domAttributes & sourceHTMLAttributes}
  ; {tag= "span"; attributes= domAttributes & attributesHTML}
  ; {tag= "strong"; attributes= domAttributes & attributesHTML}
  ; {tag= "style"; attributes= domAttributes & styleHTMLAttributes}
  ; {tag= "sub"; attributes= domAttributes & attributesHTML}
  ; {tag= "summary"; attributes= domAttributes & attributesHTML}
  ; {tag= "sup"; attributes= domAttributes & attributesHTML}
  ; {tag= "table"; attributes= domAttributes & tableHTMLAttributes}
  ; {tag= "template"; attributes= domAttributes & attributesHTML}
  ; {tag= "tbody"; attributes= domAttributes & attributesHTML}
  ; {tag= "td"; attributes= domAttributes & tdHTMLAttributes}
  ; {tag= "textarea"; attributes= domAttributes & textareaHTMLAttributes}
  ; {tag= "tfoot"; attributes= domAttributes & attributesHTML}
  ; {tag= "th"; attributes= domAttributes & thHTMLAttributes}
  ; {tag= "thead"; attributes= domAttributes & attributesHTML}
  ; {tag= "time"; attributes= domAttributes & timeHTMLAttributes}
  ; {tag= "title"; attributes= domAttributes & attributesHTML}
  ; {tag= "tr"; attributes= domAttributes & attributesHTML}
  ; {tag= "track"; attributes= domAttributes & trackHTMLAttributes}
  ; {tag= "u"; attributes= domAttributes & attributesHTML}
  ; {tag= "ul"; attributes= domAttributes & attributesHTML}
  ; {tag= "var"; attributes= domAttributes & attributesHTML}
  ; {tag= "video"; attributes= domAttributes & videoHTMLAttributes}
  ; {tag= "wbr"; attributes= domAttributes & attributesHTML}
  ; {tag= "webview"; attributes= domAttributes & webViewHTMLAttributes}
  ; {tag= "abbr"; attributes= domAttributes & attributesHTML}
  ; {tag= "address"; attributes= domAttributes & attributesHTML}
  ; {tag= "area"; attributes= attributesHTML & areaHTMLAttributes}
  ; {tag= "article"; attributes= domAttributes & attributesHTML}
  ; {tag= "aside"; attributes= domAttributes & attributesHTML}
  ; {tag= "audio"; attributes= attributesHTML & audioHTMLAttributes}
  ; {tag= "b"; attributes= domAttributes & attributesHTML}
  ; {tag= "base"; attributes= attributesHTML & baseHTMLAttributes}
  ; {tag= "bdi"; attributes= domAttributes & attributesHTML}
  ; {tag= "bdo"; attributes= domAttributes & attributesHTML}
  ; {tag= "big"; attributes= domAttributes & attributesHTML}
  ; {tag= "blockquote"; attributes= attributesHTML & blockquoteHTMLAttributes}
  ; {tag= "body"; attributes= domAttributes & attributesHTML}
  ; {tag= "br"; attributes= domAttributes & attributesHTML}
  ; {tag= "button"; attributes= attributesHTML & buttonHTMLAttributes}
  ; {tag= "canvas"; attributes= attributesHTML & canvasHTMLAttributes}
  ; {tag= "caption"; attributes= domAttributes & attributesHTML}
  ; {tag= "cite"; attributes= domAttributes & attributesHTML}
  ; {tag= "code"; attributes= domAttributes & attributesHTML}
  ; {tag= "col"; attributes= attributesHTML & colHTMLAttributes}
  ; {tag= "colgroup"; attributes= attributesHTML & colgroupHTMLAttributes}
  ; {tag= "data"; attributes= attributesHTML & dataHTMLAttributes}
  ; {tag= "datalist"; attributes= domAttributes & attributesHTML}
  ; {tag= "dd"; attributes= domAttributes & attributesHTML}
  ; {tag= "del"; attributes= attributesHTML & delHTMLAttributes}
  ; {tag= "details"; attributes= attributesHTML & detailsHTMLAttributes}
  ; {tag= "dfn"; attributes= domAttributes & attributesHTML}
  ; {tag= "dialog"; attributes= attributesHTML & dialogHTMLAttributes}
  ; {tag= "div"; attributes= domAttributes & attributesHTML}
  ; {tag= "dl"; attributes= domAttributes & attributesHTML}
  ; {tag= "dt"; attributes= domAttributes & attributesHTML}
  ; {tag= "em"; attributes= domAttributes & attributesHTML}
  ; { tag= "embed"
    ; attributes= domAttributes & attributesHTML & embedHTMLAttributes }
  ; { tag= "fieldset"
    ; attributes= domAttributes & attributesHTML & fieldsetHTMLAttributes }
  ; {tag= "figcaption"; attributes= domAttributes & attributesHTML}
  ; {tag= "figure"; attributes= domAttributes & attributesHTML}
  ; {tag= "footer"; attributes= domAttributes & attributesHTML}
  ; { tag= "form"
    ; attributes= domAttributes & attributesHTML & formHTMLAttributes }
  ; {tag= "h1"; attributes= domAttributes & attributesHTML}
  ; {tag= "h2"; attributes= domAttributes & attributesHTML}
  ; {tag= "h3"; attributes= domAttributes & attributesHTML}
  ; {tag= "h4"; attributes= domAttributes & attributesHTML}
  ; {tag= "h5"; attributes= domAttributes & attributesHTML}
  ; {tag= "h6"; attributes= domAttributes & attributesHTML}
  ; {tag= "head"; attributes= domAttributes & attributesHTML}
  ; {tag= "header"; attributes= domAttributes & attributesHTML}
  ; {tag= "hgroup"; attributes= domAttributes & attributesHTML}
  ; {tag= "hr"; attributes= domAttributes & attributesHTML}
  ; { tag= "html"
    ; attributes= domAttributes & attributesHTML & htmlHTMLAttributes }
  ; {tag= "i"; attributes= domAttributes & attributesHTML}
  ; { tag= "iframe"
    ; attributes= domAttributes & attributesHTML & iframeHTMLAttributes }
  ; {tag= "img"; attributes= domAttributes & attributesHTML & imgHTMLAttributes}
  ; { tag= "input"
    ; attributes= domAttributes & attributesHTML & inputHTMLAttributes }
  ; {tag= "ins"; attributes= domAttributes & attributesHTML & insHTMLAttributes}
  ; {tag= "kbd"; attributes= domAttributes & attributesHTML & domAttributes}
  ; { tag= "keygen"
    ; attributes= domAttributes & attributesHTML & keygenHTMLAttributes }
  ; { tag= "label"
    ; attributes= domAttributes & attributesHTML & labelHTMLAttributes }
  ; {tag= "legend"; attributes= domAttributes & attributesHTML}
  ; {tag= "li"; attributes= domAttributes & attributesHTML & liHTMLAttributes}
  ; { tag= "link"
    ; attributes= domAttributes & attributesHTML & linkHTMLAttributes }
  ; {tag= "main"; attributes= domAttributes & attributesHTML}
  ; {tag= "map"; attributes= domAttributes & attributesHTML & mapHTMLAttributes}
  ; {tag= "mark"; attributes= domAttributes & attributesHTML}
  ; { tag= "menu"
    ; attributes= domAttributes & attributesHTML & menuHTMLAttributes }
  ; {tag= "menuitem"; attributes= domAttributes & attributesHTML}
  ; { tag= "meta"
    ; attributes= domAttributes & attributesHTML & metaHTMLAttributes }
  ; { tag= "meter"
    ; attributes= domAttributes & attributesHTML & meterHTMLAttributes }
  ; {tag= "nav"; attributes= domAttributes & attributesHTML & domAttributes}
  ; {tag= "noindex"; attributes= domAttributes & attributesHTML}
  ; {tag= "noscript"; attributes= domAttributes & attributesHTML}
  ; { tag= "object_"
    ; attributes= domAttributes & attributesHTML & objectHTMLAttributes }
  ; {tag= "ol"; attributes= domAttributes & attributesHTML & olHTMLAttributes}
  ; { tag= "optgroup"
    ; attributes= domAttributes & attributesHTML & optgroupHTMLAttributes }
  ; { tag= "option"
    ; attributes= domAttributes & attributesHTML & optionHTMLAttributes }
  ; { tag= "output"
    ; attributes= domAttributes & attributesHTML & outputHTMLAttributes }
  ; {tag= "p"; attributes= domAttributes & attributesHTML}
  ; { tag= "param"
    ; attributes= domAttributes & attributesHTML & paramHTMLAttributes }
  ; {tag= "picture"; attributes= domAttributes & attributesHTML}
  ; {tag= "pre"; attributes= domAttributes & attributesHTML}
  ; { tag= "progress"
    ; attributes= domAttributes & attributesHTML & progressHTMLAttributes }
  ; {tag= "q"; attributes= domAttributes & attributesHTML & quoteHTMLAttributes}
  ; {tag= "rp"; attributes= domAttributes & attributesHTML}
  ; {tag= "rt"; attributes= domAttributes & attributesHTML}
  ; {tag= "ruby"; attributes= domAttributes & attributesHTML}
  ; {tag= "s"; attributes= domAttributes & attributesHTML}
  ; {tag= "samp"; attributes= domAttributes & attributesHTML}
  ; { tag= "slot"
    ; attributes= domAttributes & attributesHTML & slotHTMLAttributes }
  ; { tag= "script"
    ; attributes= domAttributes & attributesHTML & scriptHTMLAttributes }
  ; {tag= "section"; attributes= domAttributes & attributesHTML}
  ; { tag= "select"
    ; attributes= domAttributes & attributesHTML & selectHTMLAttributes }
  ; {tag= "small"; attributes= domAttributes & attributesHTML}
  ; { tag= "source"
    ; attributes= domAttributes & attributesHTML & sourceHTMLAttributes }
  ; {tag= "span"; attributes= domAttributes & attributesHTML}
  ; {tag= "strong"; attributes= domAttributes & attributesHTML}
  ; { tag= "style"
    ; attributes= domAttributes & attributesHTML & styleHTMLAttributes }
  ; {tag= "sub"; attributes= domAttributes & attributesHTML}
  ; {tag= "summary"; attributes= domAttributes & attributesHTML}
  ; {tag= "sup"; attributes= domAttributes & attributesHTML}
  ; {tag= "table"; attributes= attributesHTML & tableHTMLAttributes}
  ; {tag= "template"; attributes= domAttributes & attributesHTML}
  ; {tag= "tbody"; attributes= domAttributes & attributesHTML}
  ; {tag= "td"; attributes= domAttributes & attributesHTML & tdHTMLAttributes}
  ; { tag= "textarea"
    ; attributes= domAttributes & attributesHTML & textareaHTMLAttributes }
  ; {tag= "tfoot"; attributes= domAttributes & attributesHTML}
  ; {tag= "th"; attributes= domAttributes & attributesHTML & thHTMLAttributes}
  ; {tag= "thead"; attributes= domAttributes & attributesHTML}
  ; { tag= "time"
    ; attributes= domAttributes & attributesHTML & timeHTMLAttributes }
  ; {tag= "title"; attributes= domAttributes & attributesHTML}
  ; {tag= "tr"; attributes= domAttributes & attributesHTML}
  ; { tag= "track"
    ; attributes= domAttributes & attributesHTML & trackHTMLAttributes }
  ; {tag= "u"; attributes= domAttributes & attributesHTML}
  ; {tag= "ul"; attributes= domAttributes & attributesHTML}
  ; {tag= "var"; attributes= domAttributes & attributesHTML}
  ; { tag= "video"
    ; attributes= domAttributes & attributesHTML & videoHTMLAttributes }
  ; {tag= "wbr"; attributes= domAttributes & attributesHTML}
  ; { tag= "webview"
    ; attributes= domAttributes & attributesHTML & webViewHTMLAttributes } ]

let svgElements =
  [ {tag= "svg"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "animate"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "animateMotion"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "animateTransform"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "circle"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "clipPath"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "defs"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "desc"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "ellipse"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feBlend"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "feColorMatrix"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feComponentTransfer"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feComposite"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feConvolveMatrix"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feDiffuseLighting"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feDisplacementMap"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feDistantLight"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feDropShadow"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "feFlood"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feFuncA"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feFuncB"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feFuncG"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feFuncR"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "feGaussianBlur"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "feImage"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "feMerge"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "feMergeNode"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feMorphology"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "feOffset"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "fePointLight"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feSpecularLighting"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; { tag= "feSpotLight"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "feTile"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "feTurbulence"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "filter"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "foreignObject"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "g"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "image"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "line"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "linearGradient"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "marker"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "mask"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "metadata"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "mpath"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "path"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "pattern"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "polygon"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "polyline"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; { tag= "radialGradient"
    ; attributes= domAttributes & svgAttributes & ariaAttributes }
  ; {tag= "rect"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "stop"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "switch"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "symbol"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "text"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "textPath"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "tspan"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "use"; attributes= domAttributes & svgAttributes & ariaAttributes}
  ; {tag= "view"; attributes= domAttributes & svgAttributes & ariaAttributes} ]
