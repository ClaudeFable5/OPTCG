-- AUTO-GENERATED: OP09-065 / 상디
-- rules_id=OP09-065 script_id=880001161 fingerprint=abdc294f37497f751b4b66e9083b2ca9a73dbc1035e0672029d2b3fb4e84580c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            min_count=1,
            mode=[[AT_LEAST]],
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 두웅!!을 1장 이상 두웅!! 덱으로 되돌릴 수 있다: 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다. 그 후, 상대의 코스트 6 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-065]],
    schema_version=1,
  })
end
