-- AUTO-GENERATED: OP05-082 / 시라호시
-- rules_id=OP05-082 script_id=880000695 fingerprint=8563bd318003b85cfe27814c8a5c75ab8c3aaa0c13c98ee9d1292e778ef36e32
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=2,
            filter={},
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트하고, 자신의 트래시에서 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 상대의 패가 6장 이상인 경우, 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-082]],
    schema_version=1,
  })
end
