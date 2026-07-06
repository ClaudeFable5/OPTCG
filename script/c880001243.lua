-- AUTO-GENERATED: OP10-028 / 코즈키 모모노스케
-- rules_id=OP10-028 script_id=880001243 fingerprint=0660c91928cc0520e74dae66e4a0dba19eb43cccb21461435486c9755787daa4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              trait=[[아카자야 9남자]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=2,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 두웅!! 2장을 레스트하고, 이 캐릭터를 트래시에 놓을 수 있다: 자신의 덱 위에서 5장을 보고, 《아카자야 9남자》 특징을 가진 카드를 2장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-028]],
    schema_version=1,
  })
end
