-- AUTO-GENERATED: OP02-070 / 뉴커머 랜드
-- rules_id=OP02-070 script_id=880000315 fingerprint=957cc9d91914beca139af5e043be4554af556e46dcc939f954f4f850f280417f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-070]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
          {
            count=3,
            mode=[[UP_TO]],
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            name=[[엠포리오 이반코프]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트할 수 있다: 자신의 리더가 「엠포리오 이반코프」인 경우, 카드를 1장 뽑고 자신의 패 1장을 버린다. 그 후, 자신의 패를 3장까지 버린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-070]],
    schema_version=1,
  })
end
