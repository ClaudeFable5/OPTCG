-- AUTO-GENERATED: OP07-058 / 여인섬
-- rules_id=OP07-058 script_id=880000913 fingerprint=484ef206ef4289fdf2998418e6d67829c032e3d3f8e46ff82b9a057154b16898
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                trait_any={
                  [[아마존 릴리]],
                  [[구사 해적단]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
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
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 스테이지를 레스트할 수 있다: 자신의 리더가 《구사 해적단》 특징을 가진 경우, 자신의 《아마존 릴리》 또는 《구사 해적단》 특징을 가진 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-058]],
    schema_version=1,
  })
end
