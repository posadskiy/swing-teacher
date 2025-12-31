-- Flyway migration V3: Lesson 37
-- This migration contains lesson, tasks, and documentation for lesson 37

-- ============================================================================
-- TASKS AND DOCUMENTATION
-- ============================================================================

-- Task 1: Creating BorderLayout
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (313, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 1: Placing Components at Edges</h2>
<p class="intro">BorderLayout efficiently uses space. Toolbar at top, status bar at bottom, menu on left, content in center — this is standard layout. Without BorderLayout, it''s difficult to create structured interface.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Class <code>BorderLayout</code> — edge layout</li>
  <li>Regions: NORTH, SOUTH, EAST, WEST, CENTER</li>
  <li>Placing components in different regions</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>BorderLayout is necessary for creating structured interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set BorderLayout: <code>setLayout(new BorderLayout());</code></li>
  <li>Add components to regions: <code>add(new JButton("North"), BorderLayout.NORTH);</code><br>
<code>add(new JButton("South"), BorderLayout.SOUTH);</code><br>
<code>add(new JButton("Center"), BorderLayout.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Constants: NORTH, SOUTH, EAST, WEST, CENTER</li>
  <li><strong>✅ Great:</strong> CENTER takes all remaining space, NORTH and SOUTH stretch horizontally, EAST and WEST stretch vertically</li>
  <li><strong>⚠️ Avoid:</strong> Using strings instead of constants — less readable</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed at edges. Button "Top" will be at top, "Bottom" at bottom, "Center" will take middle.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (313, 'en', 'Layout Beginner: Place Components at Edges',
        'Set BorderLayout, add buttons to regions NORTH, SOUTH and CENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 2: All Regions
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (314, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 2: Using All BorderLayout Regions</h2>
<p class="intro">All regions create structured interface. Menu on left, toolbar on right, header at top, status at bottom, content in center — this is professional interface. Without all regions, interface will be incomplete.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>All BorderLayout regions</li>
  <li>Placing components in EAST and WEST</li>
  <li>Creating full interface</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Using all regions is necessary for creating full interface.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Set BorderLayout: <code>setLayout(new BorderLayout());</code></li>
  <li>Add components to all regions: <code>add(new JButton("North"), BorderLayout.NORTH);</code><br>
<code>add(new JButton("South"), BorderLayout.SOUTH);</code><br>
<code>add(new JButton("West"), BorderLayout.WEST);</code><br>
<code>add(new JButton("East"), BorderLayout.EAST);</code><br>
<code>add(new JButton("Center"), BorderLayout.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> All regions for full interface</li>
  <li><strong>✅ Great:</strong> WEST and EAST usually for menus and panels, NORTH for headers and toolbars, SOUTH for status bars, CENTER for main content</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will be placed in all regions. Buttons will be at edges and in center.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (314, 'en', 'Layout Master: Use All Regions',
        'Set BorderLayout, add buttons to all five regions: NORTH, SOUTH, EAST, WEST, CENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 3: Gaps
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (315, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 3: Adding Gaps Between Regions</h2>
<p class="intro">Gaps improve readability. Components don''t merge with each other, there is visual separation. Without gaps, interface looks overloaded.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Constructor <code>BorderLayout(int hgap, int vgap)</code> — with gaps</li>
  <li>Horizontal and vertical gaps</li>
  <li>Improving visual separation</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Gaps are necessary for improving readability and visual separation of components.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create BorderLayout with gaps: <code>setLayout(new BorderLayout(10, 10));</code></li>
  <li>Add components: <code>add(new JButton("North"), BorderLayout.NORTH);</code><br>
<code>add(new JButton("Center"), BorderLayout.CENTER);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Same gaps (10, 10)</li>
  <li><strong>✅ Great:</strong> Use different gaps (5, 10) for different effects, use small gaps (5-10 pixels)</li>
  <li><strong>⚠️ Avoid:</strong> Too large gaps — space is lost</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Gaps will appear between regions. Components will be visually separated.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (315, 'en', 'Layout Master: Add Gaps Between Regions',
        'Create BorderLayout with gaps of 10 pixels horizontally and vertically, add components to NORTH and CENTER')
ON CONFLICT (task_id, language_code) DO NOTHING;

-- Task 4: Preferred Sizes
INSERT INTO documentation_translation (documentation_id, language_code, text)
VALUES (316, 'en', '<div class="lesson-header">
<h2>🎮 Lesson 4: Accounting for Preferred Sizes</h2>
<p class="intro">Preferred sizes make interface correct. Components get needed size, don''t stretch and don''t shrink. Without accounting for sizes, components may look incorrect.</p>
</div>

<section class="learning-objectives">
<h3>📚 Learning:</h3>
<ul>
  <li>Preferred sizes of components</li>
  <li>How BorderLayout uses getPreferredSize()</li>
  <li>NORTH and SOUTH use preferred height</li>
  <li>EAST and WEST use preferred width</li>
</ul>
</section>

<section class="importance">
<h3>💎 Why it''s needed:</h3>
<p>Accounting for preferred sizes is necessary for correct component display.</p>
</section>

<section class="implementation">
<h3>⚔️ Implementation:</h3>
<ol>
  <li>Create component with preferred size: <code>JButton button = new JButton("Button");</code><br>
<code>button.setPreferredSize(new Dimension(100, 30));</code></li>
  <li>Add to region: <code>add(button, BorderLayout.NORTH);</code></li>
</ol>
</section>

<section class="best-practices">
<h3>💡 Recommendations:</h3>
<ul>
  <li><strong>✅ Use:</strong> Set preferred size for components</li>
  <li><strong>✅ Great:</strong> NORTH and SOUTH use preferred height, EAST and WEST use preferred width, CENTER takes all remaining space</li>
  <li><strong>⚠️ Avoid:</strong> Ignoring preferred sizes — may look incorrect</li>
</ul>
</section>

<section class="result">
<h3>👀 Result:</h3>
<p>Components will have correct sizes. BorderLayout will account for preferred sizes.</p>
</section>')
ON CONFLICT (documentation_id, language_code) DO NOTHING;

INSERT INTO task_translation (task_id, language_code, title, question)
VALUES (316, 'en', 'Layout Master: Account for Preferred Sizes',
        'Create button, set preferred size 100x30, add to region NORTH')
ON CONFLICT (task_id, language_code) DO NOTHING;
