-- AUTO-GENERATED: OP08-041 / 아펠란드라
-- rules_id=OP08-041 script_id=880001017 fingerprint=690f734116554a3adffb09ca7addb84f2422f80e998baea32850bb9f3f3b3cc5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_DECK_BOTTOM]],
            selector={
              count=1,
              filter={
                cost_lte=1,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[구사 해적단]],
          },
        },
        costs={
          {
            op=[[RETURN_SELF_TO_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 패로 되돌릴 수 있다: 자신의 리더가 《구사 해적단》 특징을 가진 경우, 상대의 코스트 1 이하인 캐릭터를 1장까지 주인의 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-041]],
    schema_version=1,
  })
end
