-- AUTO-GENERATED: OP12-056 / 몽키 D. 가프
-- rules_id=OP12-056 script_id=880001509 fingerprint=90318979121c2a80e37bb9ea3e0a822d321f86666c516d774015f2ff0ad06016
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              color=[[BLUE]],
              name_neq=[[몽키 D. 가프]],
              power_lte=8000,
              trait=[[해군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신의 패에서 「몽키 D. 가프」 이외의 파워 8000 이하의 청색인 《해군》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-056]],
    schema_version=1,
  })
end
